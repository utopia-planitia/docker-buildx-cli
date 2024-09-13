FROM docker:27.2.1@sha256:7e8d1849af7a99f145223810933c6cff756f74572f132b7a542936f4cfd7b733 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.17.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.2.1@sha256:7e8d1849af7a99f145223810933c6cff756f74572f132b7a542936f4cfd7b733
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
