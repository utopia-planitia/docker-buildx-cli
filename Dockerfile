FROM docker:25.0.0@sha256:a0ce13b32fcf76efcb963ff65f43978400645ed40c88fb44e69b8a962b461955 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.0@sha256:a0ce13b32fcf76efcb963ff65f43978400645ed40c88fb44e69b8a962b461955
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
