FROM docker:28.0.1@sha256:9a651b22672c7151b5d8ca820ed2290b3fe4d4922e9b3f37ab14c8876da6613d AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.21.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.0.1@sha256:9a651b22672c7151b5d8ca820ed2290b3fe4d4922e9b3f37ab14c8876da6613d
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
