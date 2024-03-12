FROM docker:25.0.4@sha256:0b0e8cab617d83dd041d950827dc67e18db5a0c3786d660bab002120b09a6d91 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.13.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.4@sha256:0b0e8cab617d83dd041d950827dc67e18db5a0c3786d660bab002120b09a6d91
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
