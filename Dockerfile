FROM docker:28.3.1@sha256:4dd2f7e405b1a10fda628f22cd466be1e3be2bcfc46db653ab620e02eeed5794 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.25.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.3.1@sha256:4dd2f7e405b1a10fda628f22cd466be1e3be2bcfc46db653ab620e02eeed5794
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
