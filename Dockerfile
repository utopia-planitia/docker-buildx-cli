FROM docker:27.3.1@sha256:8d5039800a368057d99fc0a75167d80f345ac8650850509adc7fe25c64cba9dd AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.17.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.3.1@sha256:8d5039800a368057d99fc0a75167d80f345ac8650850509adc7fe25c64cba9dd
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
