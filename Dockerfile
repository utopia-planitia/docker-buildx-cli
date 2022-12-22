FROM docker:20.10.22@sha256:9586963dcc07a22641bf03c22f43cd7e45b3107df6bf55c92d8c5098b0ac1750 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.22@sha256:9586963dcc07a22641bf03c22f43cd7e45b3107df6bf55c92d8c5098b0ac1750
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
