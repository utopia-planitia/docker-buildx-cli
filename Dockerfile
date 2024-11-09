FROM docker:27.3.1@sha256:f0c6bf0c910e0c93f1d2311f644f197257db3a5513a78513e7b846ad8bf3e202 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.18.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.3.1@sha256:f0c6bf0c910e0c93f1d2311f644f197257db3a5513a78513e7b846ad8bf3e202
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
