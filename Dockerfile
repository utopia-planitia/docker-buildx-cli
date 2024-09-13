FROM docker:27.2.1@sha256:8485ad3b695484ee3141ac7c321935201bd4e5205220e6c5f1bd301c57a7c008 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.17.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.2.1@sha256:8485ad3b695484ee3141ac7c321935201bd4e5205220e6c5f1bd301c57a7c008
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
