FROM docker:27.5.1@sha256:baade57b9dc1c2e915fa6d5fabe2b600a4b1e1323aa52c5eca53170739b0db8d AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.20.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.5.1@sha256:baade57b9dc1c2e915fa6d5fabe2b600a4b1e1323aa52c5eca53170739b0db8d
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
