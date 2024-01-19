FROM docker:24.0.7@sha256:6116ec62135d2354c3d6720ff73c2374781892a8c2c7ec528e05f90f9e5ad300 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.7@sha256:6116ec62135d2354c3d6720ff73c2374781892a8c2c7ec528e05f90f9e5ad300
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
