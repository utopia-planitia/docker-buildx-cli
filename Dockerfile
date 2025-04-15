FROM docker:28.0.4@sha256:ddb0033088b4fab74881ade341a582e3c6c8021b82377703ba1a6106bd3ded44 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.23.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.0.4@sha256:ddb0033088b4fab74881ade341a582e3c6c8021b82377703ba1a6106bd3ded44
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
