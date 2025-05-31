FROM docker:28.2.2@sha256:bbc590727c1e4fe707877314ff4f0f977bdda2985c485f2b044db0e18979efb3 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.24.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.2.2@sha256:bbc590727c1e4fe707877314ff4f0f977bdda2985c485f2b044db0e18979efb3
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
