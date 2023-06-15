FROM docker:24.0.2@sha256:f8b5e548ce35f1e177aaebae6e738315a7e9a75098d76dfae60238e0ce3a788b AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.2@sha256:f8b5e548ce35f1e177aaebae6e738315a7e9a75098d76dfae60238e0ce3a788b
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
