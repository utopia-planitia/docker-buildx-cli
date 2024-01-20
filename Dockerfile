FROM docker:25.0.0@sha256:d6de725ae4f05c424885cfa77122f06fbb431bf7e28783b5ba891119c47c1fd4 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.0@sha256:d6de725ae4f05c424885cfa77122f06fbb431bf7e28783b5ba891119c47c1fd4
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
