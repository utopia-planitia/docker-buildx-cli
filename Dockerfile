FROM docker:28.3.3@sha256:a56b3bdde89315ed2cc0e4906e582b5033d93bf20d9cb9510c2cdd4e7f7690b1 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.27.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.3.3@sha256:a56b3bdde89315ed2cc0e4906e582b5033d93bf20d9cb9510c2cdd4e7f7690b1
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
