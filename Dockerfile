FROM docker:20.10.21@sha256:4ae1444ef191366429581854edcf0a16f260b7a0ed90f4d5d1d95265356642ae AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.21@sha256:4ae1444ef191366429581854edcf0a16f260b7a0ed90f4d5d1d95265356642ae
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
