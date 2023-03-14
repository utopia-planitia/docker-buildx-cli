FROM docker:23.0.1@sha256:3a09aaa775e328ec0817cb9b060e68c94ccf135f290c70f8189fbf2128ecdd9c AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.1@sha256:3a09aaa775e328ec0817cb9b060e68c94ccf135f290c70f8189fbf2128ecdd9c
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
