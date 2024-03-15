FROM docker:25.0.4@sha256:93529df8cf4b81a55dfe1a24828b775b5912307314783e64868acca36342f573 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.13.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.4@sha256:93529df8cf4b81a55dfe1a24828b775b5912307314783e64868acca36342f573
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
