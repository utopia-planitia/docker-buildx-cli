FROM docker:25.0.4@sha256:96637a2755acf4eaea3f15da24c03d88b86468a691a640c51a527b27622c2b58 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.13.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.4@sha256:96637a2755acf4eaea3f15da24c03d88b86468a691a640c51a527b27622c2b58
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
