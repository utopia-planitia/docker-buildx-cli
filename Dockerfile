FROM docker:25.0.1@sha256:1e79641cb6115133cf42a5bb096a9614f8d5abc8d4cca32ff57c363e972a12cf AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.1@sha256:1e79641cb6115133cf42a5bb096a9614f8d5abc8d4cca32ff57c363e972a12cf
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
