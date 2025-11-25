FROM docker:29.0.4@sha256:c9699f4fc7365e8daad3eb48ce3b62dc118b2a5267f7be7bcd3c4e4b2f1cfb4c AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.30.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.0.4@sha256:c9699f4fc7365e8daad3eb48ce3b62dc118b2a5267f7be7bcd3c4e4b2f1cfb4c
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
