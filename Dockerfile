FROM docker:27.4.1@sha256:6864c0479398023a5180cdf87e8e67ec9dcb706a21def1684f47b4ad66624d59 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.19.3
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.4.1@sha256:6864c0479398023a5180cdf87e8e67ec9dcb706a21def1684f47b4ad66624d59
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
