FROM docker:27.2.1@sha256:294f99b7749b47d3bfac8535c231a6c47cd0f28be8205af83928b2dde18abda7 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.17.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.2.1@sha256:294f99b7749b47d3bfac8535c231a6c47cd0f28be8205af83928b2dde18abda7
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
