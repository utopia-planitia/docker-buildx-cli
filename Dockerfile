FROM docker:20.10.16@sha256:101f87347f4f6e14857f00f216d838399cc879791a6c6c15e00cc374c1ff55b5 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.16@sha256:101f87347f4f6e14857f00f216d838399cc879791a6c6c15e00cc374c1ff55b5
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
