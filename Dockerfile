FROM docker:27.3.1@sha256:6ca9a6811085e2cf769cbac04bc47daf66629102990391caab7cf37426e939da AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.19.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.3.1@sha256:6ca9a6811085e2cf769cbac04bc47daf66629102990391caab7cf37426e939da
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
