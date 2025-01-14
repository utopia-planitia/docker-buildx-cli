FROM docker:27.5.0@sha256:cbde039f51b3d85366f59fe2e97cdaf329a6eef076b79a9afb9f9568d04d0767 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.19.3
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.5.0@sha256:cbde039f51b3d85366f59fe2e97cdaf329a6eef076b79a9afb9f9568d04d0767
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
