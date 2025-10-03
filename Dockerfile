FROM docker:28.5.0@sha256:c090c93b63bc690570a0cab398904c855a46f08e0b6804e51bb5ad26e3407f9a AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.29.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.5.0@sha256:c090c93b63bc690570a0cab398904c855a46f08e0b6804e51bb5ad26e3407f9a
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
