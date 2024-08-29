FROM docker:27.2.0@sha256:f9f72ad901a78f27be922b2d320bbc263174f12919c1b37e6a01f828fa904565 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.16.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.2.0@sha256:f9f72ad901a78f27be922b2d320bbc263174f12919c1b37e6a01f828fa904565
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
