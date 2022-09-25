FROM docker:20.10.18@sha256:a7984be85b34c64a2073622b6287de0ad28799a82c1d7256174a486cc8a2ecbe AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.18@sha256:a7984be85b34c64a2073622b6287de0ad28799a82c1d7256174a486cc8a2ecbe
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
