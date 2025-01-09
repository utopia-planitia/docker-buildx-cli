FROM docker:27.4.1@sha256:9788e053d0ed20669ddda70b62f3409ff85cc267cc28736f3968b4a89c21c871 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.19.3
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.4.1@sha256:9788e053d0ed20669ddda70b62f3409ff85cc267cc28736f3968b4a89c21c871
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
