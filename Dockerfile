FROM docker:24.0.2@sha256:0ecf72e876d2c7e56dd6d97c58d732f2dce8fbcb5905a031d957c5da1375fe45 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.2@sha256:0ecf72e876d2c7e56dd6d97c58d732f2dce8fbcb5905a031d957c5da1375fe45
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
