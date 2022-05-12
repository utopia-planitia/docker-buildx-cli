FROM docker:20.10.16@sha256:5d189fc5e5f970db40c8656f1f5dcf25bbbf0861598fda4953ea9ca49059e5cc AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.16@sha256:5d189fc5e5f970db40c8656f1f5dcf25bbbf0861598fda4953ea9ca49059e5cc
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
