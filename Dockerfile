FROM docker:27.2.1@sha256:c51fa20028ff6590588d9ed97d3b16865d503a3d7228aa885871c5c292afa5ca AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.16.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.2.1@sha256:c51fa20028ff6590588d9ed97d3b16865d503a3d7228aa885871c5c292afa5ca
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
