FROM docker:27.3.0@sha256:e16df3c5e703eae2b2162358f33af9db78c2a9c1721b496fababceec26859742 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.17.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.3.0@sha256:e16df3c5e703eae2b2162358f33af9db78c2a9c1721b496fababceec26859742
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
