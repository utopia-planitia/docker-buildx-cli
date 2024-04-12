FROM docker:26.0.1@sha256:9fc71aa775289a95979f178fa3b2a8da43b118348cc9065615e83839c2f075bc AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.13.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.0.1@sha256:9fc71aa775289a95979f178fa3b2a8da43b118348cc9065615e83839c2f075bc
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
