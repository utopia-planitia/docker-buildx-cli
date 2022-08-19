FROM docker:20.10.17@sha256:fc6290667899ccf28586aeeb114fc8ea3121a50b014c8d33bea4f6418546e9a3 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.17@sha256:fc6290667899ccf28586aeeb114fc8ea3121a50b014c8d33bea4f6418546e9a3
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
