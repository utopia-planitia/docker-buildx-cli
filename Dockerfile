FROM docker:25.0.1@sha256:081b45ad5278e6a5a6c80a66fc36cb5bccf852960e37c830ddea925bfeee7ea6 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.1@sha256:081b45ad5278e6a5a6c80a66fc36cb5bccf852960e37c830ddea925bfeee7ea6
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
