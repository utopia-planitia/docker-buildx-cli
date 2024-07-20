FROM docker:27.0.3@sha256:75f620cbf8e87543ec1fb0bf98fa2cfde8f684308dafb6c50cc75f3a235fa1fc AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.16.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.0.3@sha256:75f620cbf8e87543ec1fb0bf98fa2cfde8f684308dafb6c50cc75f3a235fa1fc
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
