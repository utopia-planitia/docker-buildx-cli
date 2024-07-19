FROM docker:27.0.3@sha256:5bf73daca1e5575772bdfd196a48cfeb6fd65f4affd2d83b42b16db36a2d2974 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.16.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.0.3@sha256:5bf73daca1e5575772bdfd196a48cfeb6fd65f4affd2d83b42b16db36a2d2974
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
