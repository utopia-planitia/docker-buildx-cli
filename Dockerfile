FROM docker:23.0.0@sha256:754b29ca7d5656d45d6de119fd36882720c3335341ad44e2c6eb28882339fac7 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.0@sha256:754b29ca7d5656d45d6de119fd36882720c3335341ad44e2c6eb28882339fac7
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
