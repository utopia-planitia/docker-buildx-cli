FROM docker:24.0.3@sha256:8c39dc84d3a2cf61545c50689140f0cb29a672b8bccac1a5ebce12b402c9b32f AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.3@sha256:8c39dc84d3a2cf61545c50689140f0cb29a672b8bccac1a5ebce12b402c9b32f
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
