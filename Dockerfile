FROM docker:20.10.13@sha256:24ce434e9bf049bd60d4810708f3ac0ec56810ea47fc092aff5dde4c5317a4f1 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.13@sha256:24ce434e9bf049bd60d4810708f3ac0ec56810ea47fc092aff5dde4c5317a4f1
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
