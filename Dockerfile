FROM docker:26.0.0@sha256:645776ce2ff39e4889a887d05622e57c62f8a54f4f0a5376312b4d091483026d AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.13.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.0.0@sha256:645776ce2ff39e4889a887d05622e57c62f8a54f4f0a5376312b4d091483026d
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
