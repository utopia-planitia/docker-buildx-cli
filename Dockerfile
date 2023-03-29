FROM docker:23.0.2@sha256:3244651a4b128181bdb22f45d991d7e34df72a861075394b26a514dcc4272ca0 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.2@sha256:3244651a4b128181bdb22f45d991d7e34df72a861075394b26a514dcc4272ca0
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
