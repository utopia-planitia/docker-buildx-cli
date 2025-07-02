FROM docker:28.3.0@sha256:c621e5090b92e66b7f2a668e80f4375c30f797fe60fdc16fdde3471c37acd0d7 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.25.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.3.0@sha256:c621e5090b92e66b7f2a668e80f4375c30f797fe60fdc16fdde3471c37acd0d7
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
