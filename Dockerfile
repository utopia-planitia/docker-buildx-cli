FROM docker:20.10.17@sha256:6c5c8b70d0de524ff092921c05ebe9c1b0d05c29962d6717666b29049e52aefe AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.17@sha256:6c5c8b70d0de524ff092921c05ebe9c1b0d05c29962d6717666b29049e52aefe
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
