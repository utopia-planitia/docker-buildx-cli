FROM docker:27.3.1@sha256:25654f4044cf31ea6ca67707a767c2e7773a5266762aeba44e77307f2166ae2d AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.18.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.3.1@sha256:25654f4044cf31ea6ca67707a767c2e7773a5266762aeba44e77307f2166ae2d
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
