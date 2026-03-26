FROM docker:29.3.1@sha256:4d90f1f6c400315c2dba96d3ec93c01e64198395cbba04f79d12adce4f737029 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.32.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.3.1@sha256:4d90f1f6c400315c2dba96d3ec93c01e64198395cbba04f79d12adce4f737029
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
