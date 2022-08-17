FROM docker:20.10.17@sha256:20bbfcfbdd8e6a7ad771dd9ce6546bd94dda7bfc0d25c21edb7aaf9118079939 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.17@sha256:20bbfcfbdd8e6a7ad771dd9ce6546bd94dda7bfc0d25c21edb7aaf9118079939
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
