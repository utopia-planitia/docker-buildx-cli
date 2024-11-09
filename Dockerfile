FROM docker:27.3.1@sha256:fa46292d775fb5d44a8e866efc723e70172561a81ea02c3981374e97bf4fbcaa AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.18.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.3.1@sha256:fa46292d775fb5d44a8e866efc723e70172561a81ea02c3981374e97bf4fbcaa
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
