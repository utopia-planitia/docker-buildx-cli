FROM docker:20.10.21@sha256:812ff1098c97878ae26ca8e0423e00aa157596a8b28d4bd52c120c4d087e8ae1 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.21@sha256:812ff1098c97878ae26ca8e0423e00aa157596a8b28d4bd52c120c4d087e8ae1
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
