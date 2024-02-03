FROM docker:25.0.2@sha256:2a4b002009607c6b7d294eb4929fb637dc1a9aa3b31f4f60fb4fc5f860080f8e AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.2@sha256:2a4b002009607c6b7d294eb4929fb637dc1a9aa3b31f4f60fb4fc5f860080f8e
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
