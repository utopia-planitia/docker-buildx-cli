FROM docker:28.3.1@sha256:0a2ee60851e1b61a54707476526c4ed48cc55641a17a5cba8a77fb78e7a4742c AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.25.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.3.1@sha256:0a2ee60851e1b61a54707476526c4ed48cc55641a17a5cba8a77fb78e7a4742c
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
