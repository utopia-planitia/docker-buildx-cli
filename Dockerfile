FROM docker:20.10.18@sha256:fd6932977dc8674c76b7f8a37a944458a7c0e8057c5b456a6b516fe78f3390bb AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.18@sha256:fd6932977dc8674c76b7f8a37a944458a7c0e8057c5b456a6b516fe78f3390bb
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
