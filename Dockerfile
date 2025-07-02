FROM docker:28.3.0@sha256:56e360024d7d35dac801b8fc87f869ccf5c89b88399dd266f7cfc1169690a86b AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.25.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.3.0@sha256:56e360024d7d35dac801b8fc87f869ccf5c89b88399dd266f7cfc1169690a86b
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
