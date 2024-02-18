FROM docker:25.0.3@sha256:f837abeefde97276de9505056743c602d6938d2b49b2066bee3ae3b359ec8b78 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.3@sha256:f837abeefde97276de9505056743c602d6938d2b49b2066bee3ae3b359ec8b78
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
