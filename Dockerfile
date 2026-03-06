FROM docker:29.3.0@sha256:1ba18449911d01f477a3fc104123c85d677addc60701b14b3fcb5381f9c4a537 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.32.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.3.0@sha256:1ba18449911d01f477a3fc104123c85d677addc60701b14b3fcb5381f9c4a537
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
