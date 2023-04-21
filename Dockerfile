FROM docker:23.0.4@sha256:e40881e5e9ab5361c288a1ab43b4120f6115be61fa21019b43adf0b27b1fbfb1 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.4@sha256:e40881e5e9ab5361c288a1ab43b4120f6115be61fa21019b43adf0b27b1fbfb1
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
