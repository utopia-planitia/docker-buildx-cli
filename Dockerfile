FROM docker:20.10.13@sha256:72e87d4f1d2ed054bf9ec48c77dfc546c7e6173fe9b6afd9e80716b9c5ade4bb AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.13@sha256:72e87d4f1d2ed054bf9ec48c77dfc546c7e6173fe9b6afd9e80716b9c5ade4bb
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
