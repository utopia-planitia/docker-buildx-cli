FROM docker:20.10.21@sha256:83b5f0a88fc82a724c1ffdc4220e49aed855e7db3f30ab0ac3d27c515346caca AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.21@sha256:83b5f0a88fc82a724c1ffdc4220e49aed855e7db3f30ab0ac3d27c515346caca
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
