FROM docker:24.0.7@sha256:ca9a56ffc0339a72cbf2beb7650f4423258f405520dcc7ac9af4858cfdc09fce AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.7@sha256:ca9a56ffc0339a72cbf2beb7650f4423258f405520dcc7ac9af4858cfdc09fce
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
