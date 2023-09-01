FROM docker:24.0.5@sha256:3c6e4dca7a63c9a32a4e00da40461ce067f255987ccc9721cf18ffa087bcd1ef AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.5@sha256:3c6e4dca7a63c9a32a4e00da40461ce067f255987ccc9721cf18ffa087bcd1ef
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
