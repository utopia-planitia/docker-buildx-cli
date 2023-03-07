FROM docker:23.0.1@sha256:3cf33ff6e893a39262bd9f6b85ff46e068fa2a98d201326e9c3058a22a21a6bb AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.1@sha256:3cf33ff6e893a39262bd9f6b85ff46e068fa2a98d201326e9c3058a22a21a6bb
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
