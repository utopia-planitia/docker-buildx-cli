FROM docker:20.10.12@sha256:a729cce205a05b0b86dc8dca87823efaffc3f74979fe7dc86a707c2fbf631b61 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.12@sha256:a729cce205a05b0b86dc8dca87823efaffc3f74979fe7dc86a707c2fbf631b61
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
