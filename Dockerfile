FROM docker:27.3.1@sha256:c84753f103b8999d48fe8a59f1c24122f79b288e697b49953aff852141060966 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.19.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.3.1@sha256:c84753f103b8999d48fe8a59f1c24122f79b288e697b49953aff852141060966
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
