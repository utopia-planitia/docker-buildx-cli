FROM docker:26.1.3@sha256:1ff6086d17277f3bc4aa1da23426c84f39d256fe8b3d54fa54ebb1c05863f58d AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.14.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.3@sha256:1ff6086d17277f3bc4aa1da23426c84f39d256fe8b3d54fa54ebb1c05863f58d
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
