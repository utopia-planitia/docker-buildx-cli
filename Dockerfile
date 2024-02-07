FROM docker:25.0.3@sha256:88f932b877721b83149074dd4a9347bfd2554b2b83ceb1fd5430156937ad6086 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.3@sha256:88f932b877721b83149074dd4a9347bfd2554b2b83ceb1fd5430156937ad6086
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
