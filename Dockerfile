FROM docker:26.1.4@sha256:03bffdab04d53ee2d34d2950f5a1bed008b5183b309e57d41244768a070da940 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.15.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.4@sha256:03bffdab04d53ee2d34d2950f5a1bed008b5183b309e57d41244768a070da940
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
