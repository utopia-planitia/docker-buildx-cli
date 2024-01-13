FROM docker:24.0.7@sha256:a293bf8de927f0b6f5425408a0172c9c2896b14e2be86d40a9d10eaaf0025b11 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.7@sha256:a293bf8de927f0b6f5425408a0172c9c2896b14e2be86d40a9d10eaaf0025b11
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
