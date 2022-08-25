FROM docker:20.10.17@sha256:942e80f778a9d5c60d474d4eadae3736b39434a60ab51644bb4c989ebfa44928 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.17@sha256:942e80f778a9d5c60d474d4eadae3736b39434a60ab51644bb4c989ebfa44928
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
