FROM docker:29.1.3@sha256:173f284a4299164772a90f52b373e73e087583c0963f1334c9995f190ef6f3f5 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.30.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.1.3@sha256:173f284a4299164772a90f52b373e73e087583c0963f1334c9995f190ef6f3f5
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
