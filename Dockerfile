FROM docker:29.1.3@sha256:7370a6c49b7e708fb969b422dffe6cdd78a9f0ff5b3bfba0e0cddce736c49eaf AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.30.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.1.3@sha256:7370a6c49b7e708fb969b422dffe6cdd78a9f0ff5b3bfba0e0cddce736c49eaf
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
