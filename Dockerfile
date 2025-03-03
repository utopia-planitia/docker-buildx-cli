FROM docker:28.0.1@sha256:0336b60f3134d98d26a069856780f9e58dbc3219cde49ca85be14c8e3c3446e2 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.21.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.0.1@sha256:0336b60f3134d98d26a069856780f9e58dbc3219cde49ca85be14c8e3c3446e2
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
