FROM docker:28.5.1@sha256:ea9d20492ca1caaaba78e68453433895d256173c79281756e88b745647fcbcfd AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.29.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.5.1@sha256:ea9d20492ca1caaaba78e68453433895d256173c79281756e88b745647fcbcfd
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
