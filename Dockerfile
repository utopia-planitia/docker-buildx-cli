FROM docker:29.5.3@sha256:7278248384185bcbb54c7a76b2f0a7d354c4aac920605cc1ab48968d961052fb AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.35.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.5.3@sha256:7278248384185bcbb54c7a76b2f0a7d354c4aac920605cc1ab48968d961052fb
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
