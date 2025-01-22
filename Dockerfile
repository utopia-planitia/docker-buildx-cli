FROM docker:27.5.0@sha256:9337966690e64b438e049489f9e9392e796b579657bf0b838c2b508a33da2b4d AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.20.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.5.0@sha256:9337966690e64b438e049489f9e9392e796b579657bf0b838c2b508a33da2b4d
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
