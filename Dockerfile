FROM docker:24.0.2@sha256:f44bd33ee57baf0830d8c07a1abd7ce40301a446e819b86ad0d99735c049f6a5 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.5
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.2@sha256:f44bd33ee57baf0830d8c07a1abd7ce40301a446e819b86ad0d99735c049f6a5
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
