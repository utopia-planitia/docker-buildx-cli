FROM docker:24.0.4@sha256:594b3a4dc012e5160fed2a5c47a36ac5af6fa25f0c155bd9cff23d4f8c6fec16 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.4@sha256:594b3a4dc012e5160fed2a5c47a36ac5af6fa25f0c155bd9cff23d4f8c6fec16
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
