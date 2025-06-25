FROM docker:28.3.0@sha256:85ed11849f25fa5b4d6ce6bc0b53c6738ab3e7d65c9457c2e26a1e404015be4e AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.25.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.3.0@sha256:85ed11849f25fa5b4d6ce6bc0b53c6738ab3e7d65c9457c2e26a1e404015be4e
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
