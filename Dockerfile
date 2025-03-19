FROM docker:28.0.1@sha256:57c187c09358d72543ae5471b993c0799b07e96f7f404fec274f7af3a41986eb AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.22.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.0.1@sha256:57c187c09358d72543ae5471b993c0799b07e96f7f404fec274f7af3a41986eb
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
