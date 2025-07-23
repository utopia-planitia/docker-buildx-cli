FROM docker:28.3.2@sha256:569bb59d63caccc51537695be44a905d22f5252525d0a84f7f2eab39ba81ed21 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.26.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.3.2@sha256:569bb59d63caccc51537695be44a905d22f5252525d0a84f7f2eab39ba81ed21
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
