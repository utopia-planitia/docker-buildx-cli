FROM docker:23.0.1@sha256:823f503dabbb07717e2e88e3648d4eae4d77fbe3ea5d91a467a459f1aec7efcf AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.1@sha256:823f503dabbb07717e2e88e3648d4eae4d77fbe3ea5d91a467a459f1aec7efcf
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
