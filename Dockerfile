FROM docker:27.3.1@sha256:bec82cb05983f12a14d8f169b00748f4ded8573f4da5f1d15d375b6a2470289f AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.19.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.3.1@sha256:bec82cb05983f12a14d8f169b00748f4ded8573f4da5f1d15d375b6a2470289f
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
