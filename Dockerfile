FROM docker:20.10.23@sha256:2245cd9cd5bc068987a1d3fd9eede6faf8231b396bba968234fffbeb01b09648 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.23@sha256:2245cd9cd5bc068987a1d3fd9eede6faf8231b396bba968234fffbeb01b09648
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
