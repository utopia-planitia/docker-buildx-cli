FROM docker:23.0.0@sha256:e6055f8f3631220803c49658b5c1513a6db428afb0eda193ead270331642ae62 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.0@sha256:e6055f8f3631220803c49658b5c1513a6db428afb0eda193ead270331642ae62
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
