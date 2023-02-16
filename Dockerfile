FROM docker:23.0.1@sha256:44cd33fb5235eb32c853f17b6ae6dea3cc3fb9239b83f2e732c7de6f94829a72 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.3
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.1@sha256:44cd33fb5235eb32c853f17b6ae6dea3cc3fb9239b83f2e732c7de6f94829a72
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
