FROM docker:23.0.6@sha256:ed09448da6f2d4bd1ac208a923a2a962cc203dabb60111acd33111728214e93a AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.6@sha256:ed09448da6f2d4bd1ac208a923a2a962cc203dabb60111acd33111728214e93a
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
