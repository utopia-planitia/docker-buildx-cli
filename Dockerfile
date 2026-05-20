FROM docker:29.5.1@sha256:eed377f3ce14afda560e742c5b3ae446df1ce00a16e1beab2ac6c78c1477fe85 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.34.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.5.1@sha256:eed377f3ce14afda560e742c5b3ae446df1ce00a16e1beab2ac6c78c1477fe85
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
