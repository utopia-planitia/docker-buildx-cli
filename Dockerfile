FROM docker:29.1.5@sha256:3a33fc81fa4d38360f490f5b900e9846f725db45bb1d9b1fe02d849bd42a5cf2 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.30.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.1.5@sha256:3a33fc81fa4d38360f490f5b900e9846f725db45bb1d9b1fe02d849bd42a5cf2
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
