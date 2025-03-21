FROM docker:28.0.2@sha256:2bb691ba28efd798c67bfcea6f7b1dda19c969ceabc2f32480e8b153e79c647f AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.22.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.0.2@sha256:2bb691ba28efd798c67bfcea6f7b1dda19c969ceabc2f32480e8b153e79c647f
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
