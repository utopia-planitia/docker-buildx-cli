FROM docker:28.1.1@sha256:3a861ec98623bd6014610291123751dc19e0c6d474ac3b38767771791ac0eb5e AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.23.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.1.1@sha256:3a861ec98623bd6014610291123751dc19e0c6d474ac3b38767771791ac0eb5e
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
