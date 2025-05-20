FROM docker:28.1.1@sha256:1e9d444274b295261e49f96635f3d56a615cb3ae2021204160f8ac3cdf8f3b58 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.23.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.1.1@sha256:1e9d444274b295261e49f96635f3d56a615cb3ae2021204160f8ac3cdf8f3b58
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
