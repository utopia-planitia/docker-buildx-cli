FROM docker:24.0.0@sha256:6893622dae740d55e7879ff7a3d0a3f641e2bb639ea6bbc74bdabfa531db4785 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.0@sha256:6893622dae740d55e7879ff7a3d0a3f641e2bb639ea6bbc74bdabfa531db4785
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
