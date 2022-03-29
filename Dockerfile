FROM docker:20.10.14@sha256:7dad83861f0b28bd6a0b281dc5f72144927b9f8173e388e461c8feba6be20bec AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.14@sha256:7dad83861f0b28bd6a0b281dc5f72144927b9f8173e388e461c8feba6be20bec
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
