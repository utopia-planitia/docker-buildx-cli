FROM docker:20.10.20@sha256:b39aa91b8a31462d6e86da84762891f6d2ac5657d34d9bf86fd1d0bd7b60e0d8 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.20@sha256:b39aa91b8a31462d6e86da84762891f6d2ac5657d34d9bf86fd1d0bd7b60e0d8
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
