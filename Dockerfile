FROM docker:20.10.16@sha256:5bc07a93c9b28e57a58d57fbcf437d1551ff80ae33b4274fb60a1ade2d6c9da4 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.16@sha256:5bc07a93c9b28e57a58d57fbcf437d1551ff80ae33b4274fb60a1ade2d6c9da4
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
