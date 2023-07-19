FROM docker:24.0.4@sha256:ec0c2cf754e65f0a97af7e9fa17294eac0240df9082c5a234da81503858427e2 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.4@sha256:ec0c2cf754e65f0a97af7e9fa17294eac0240df9082c5a234da81503858427e2
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
