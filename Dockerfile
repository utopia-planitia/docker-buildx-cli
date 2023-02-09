FROM docker:23.0.0@sha256:210f22afb3022a5fb994eeacd18d983c9760efd6f793ee2bf3a3467aef0c583a AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.0@sha256:210f22afb3022a5fb994eeacd18d983c9760efd6f793ee2bf3a3467aef0c583a
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
