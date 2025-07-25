FROM docker:28.3.2@sha256:44383404ebf0c36243f5969f0dddd23c204ea3bb185e7473a4141f6ccfd07b53 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.26.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.3.2@sha256:44383404ebf0c36243f5969f0dddd23c204ea3bb185e7473a4141f6ccfd07b53
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
