FROM docker:20.10.13@sha256:9597f07edf69996194651e432f87fef5920236d5fd75afadc0273b6e7c0d9bb8 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.13@sha256:9597f07edf69996194651e432f87fef5920236d5fd75afadc0273b6e7c0d9bb8
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
