FROM docker:20.10.20@sha256:466edff9fbc8e1326259d04412f55684c2e0f79c574eb9782c252011a87d8046 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.20@sha256:466edff9fbc8e1326259d04412f55684c2e0f79c574eb9782c252011a87d8046
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
