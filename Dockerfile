FROM docker:26.0.2@sha256:c8d3a4b0f8c9f09c8d220fc68028a401f5b7f5c159a7dd62fc0915f8617ea66f AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.14.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.0.2@sha256:c8d3a4b0f8c9f09c8d220fc68028a401f5b7f5c159a7dd62fc0915f8617ea66f
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
