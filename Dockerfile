FROM docker:24.0.5@sha256:020562d22f11c27997e00da910ed6b580d93094bc25841cb87aacab4ced4a882 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.5@sha256:020562d22f11c27997e00da910ed6b580d93094bc25841cb87aacab4ced4a882
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
