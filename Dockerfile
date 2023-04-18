FROM docker:23.0.4@sha256:c20b7d2415de59f308553646712d9b1d92f4186aeaf8b04afae7f42129dab425 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.4@sha256:c20b7d2415de59f308553646712d9b1d92f4186aeaf8b04afae7f42129dab425
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
