FROM docker:24.0.2@sha256:ccca3d366645e79444fd51b0d77fdc9a002706c46dc4bc7c6b22c7e04f26af54 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.2@sha256:ccca3d366645e79444fd51b0d77fdc9a002706c46dc4bc7c6b22c7e04f26af54
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
