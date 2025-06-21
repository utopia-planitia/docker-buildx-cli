FROM docker:28.2.2@sha256:5fb3f5b69bdab6690d93398a316fdfe906ae4d30667e07994ea5be66483c7b3b AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.25.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.2.2@sha256:5fb3f5b69bdab6690d93398a316fdfe906ae4d30667e07994ea5be66483c7b3b
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
