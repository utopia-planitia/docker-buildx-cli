FROM docker:27.3.1@sha256:fa2054c5a83f1eacc2700f2fe8c5a3b7f8e2a3fcbfb5e24be0436d3a98f7d140 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.18.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.3.1@sha256:fa2054c5a83f1eacc2700f2fe8c5a3b7f8e2a3fcbfb5e24be0436d3a98f7d140
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
