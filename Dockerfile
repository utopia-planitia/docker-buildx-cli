FROM docker:23.0.1@sha256:313f03f8946a38f72c45f224efead3b8c6b3a222f83ac323bf7a83e6351044be AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.1@sha256:313f03f8946a38f72c45f224efead3b8c6b3a222f83ac323bf7a83e6351044be
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
