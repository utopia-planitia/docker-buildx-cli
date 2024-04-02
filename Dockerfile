FROM docker:26.0.0@sha256:557204dd876c17dc674d03af9083ad2d19f27848e76b6022d17a289efbd4f9c9 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.13.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.0.0@sha256:557204dd876c17dc674d03af9083ad2d19f27848e76b6022d17a289efbd4f9c9
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
