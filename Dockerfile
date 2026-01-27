FROM docker:29.2.0@sha256:6a58fe0da3d9c36bae9adb37ec6af8cb07b5a1d02aa72ae5ad370d7ecbafdfcd AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.31.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.2.0@sha256:6a58fe0da3d9c36bae9adb37ec6af8cb07b5a1d02aa72ae5ad370d7ecbafdfcd
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
