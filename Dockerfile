FROM docker:27.4.1@sha256:a6cd14b3545749a0fd1eb97c78234de660631523005dd1fe8c91388314454a53 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.19.3
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.4.1@sha256:a6cd14b3545749a0fd1eb97c78234de660631523005dd1fe8c91388314454a53
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
