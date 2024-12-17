FROM docker:27.4.0@sha256:b0c1179ea32ad77bdb7b852b037e54b11022304c2f2662af1954ef53869314b2 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.19.3
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.4.0@sha256:b0c1179ea32ad77bdb7b852b037e54b11022304c2f2662af1954ef53869314b2
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
