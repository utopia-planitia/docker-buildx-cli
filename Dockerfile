FROM docker:20.10.16@sha256:c24538b2a7a081efc81185772bd8066d33cbf1f3e1a8249657395bdad4d5f844 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.16@sha256:c24538b2a7a081efc81185772bd8066d33cbf1f3e1a8249657395bdad4d5f844
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
