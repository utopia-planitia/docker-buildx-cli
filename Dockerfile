FROM docker:28.2.2@sha256:7613944c7bc318c7b97541bd0e65b8a18d033e37e204305f1ee2639fc9a03827 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.25.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.2.2@sha256:7613944c7bc318c7b97541bd0e65b8a18d033e37e204305f1ee2639fc9a03827
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
