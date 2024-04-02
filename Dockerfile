FROM docker:26.0.0@sha256:7ff986c816ccc8af25c9f560ca0cba45de2ca2ea2d7099c63099f5539e0d0359 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.13.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.0.0@sha256:7ff986c816ccc8af25c9f560ca0cba45de2ca2ea2d7099c63099f5539e0d0359
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
