FROM docker:28.3.2@sha256:be84ce099f7ead42292ebabb539a536df0a4435646c80e50c78a55e0d4f421c5 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.26.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.3.2@sha256:be84ce099f7ead42292ebabb539a536df0a4435646c80e50c78a55e0d4f421c5
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
