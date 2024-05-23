FROM docker:26.1.3@sha256:b2fd214f02e116a95a7e12b55637dc7a36a823449289abda26deb468c687922f AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.14.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.3@sha256:b2fd214f02e116a95a7e12b55637dc7a36a823449289abda26deb468c687922f
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
