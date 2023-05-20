FROM docker:24.0.1@sha256:ff3b9bc6b87e85ce3a374eef7a8daeb3b23cfa6fa6024382e63041a940cc25b4 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.1@sha256:ff3b9bc6b87e85ce3a374eef7a8daeb3b23cfa6fa6024382e63041a940cc25b4
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
