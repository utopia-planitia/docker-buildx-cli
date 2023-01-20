FROM docker:20.10.22@sha256:57721058dcb11dcbafac38c862933a117ab7d5fa598bbe6217f6a3131d30b5e9 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.22@sha256:57721058dcb11dcbafac38c862933a117ab7d5fa598bbe6217f6a3131d30b5e9
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
