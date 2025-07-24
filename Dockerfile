FROM docker:28.3.2@sha256:c1a6c318d7dccd659d557df84261817335844b69ca92e919ebf3e6183266ce4b AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.26.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.3.2@sha256:c1a6c318d7dccd659d557df84261817335844b69ca92e919ebf3e6183266ce4b
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
