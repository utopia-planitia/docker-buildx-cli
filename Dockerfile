FROM docker:24.0.7@sha256:c90e58d30700470fc59bdaaf802340fd25c1db628756d7bf74e100c566ba9589 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.7@sha256:c90e58d30700470fc59bdaaf802340fd25c1db628756d7bf74e100c566ba9589
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
