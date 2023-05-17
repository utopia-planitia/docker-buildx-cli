FROM docker:24.0.0@sha256:29a8ec20e19581efc0f209a1eaddb5ff021e497520f7ed973c282c264f23be78 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.0@sha256:29a8ec20e19581efc0f209a1eaddb5ff021e497520f7ed973c282c264f23be78
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
