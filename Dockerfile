FROM docker:20.10.17@sha256:0c4066e2407fb67b5cb609aa2ea380cdd774445e6be1cd651096167963125af5 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.17@sha256:0c4066e2407fb67b5cb609aa2ea380cdd774445e6be1cd651096167963125af5
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
