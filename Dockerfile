FROM docker:28.3.2@sha256:f341edb0395a4bc8a00629821a5fa48d6c0055d88901b10aac42787d6ba76eae AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.26.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.3.2@sha256:f341edb0395a4bc8a00629821a5fa48d6c0055d88901b10aac42787d6ba76eae
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
