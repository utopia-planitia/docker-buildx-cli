FROM docker:23.0.2@sha256:29f11c7c63c84a51c45901701c2d16336c9abc6365d3a69136884b3cf15e2cc9 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.2@sha256:29f11c7c63c84a51c45901701c2d16336c9abc6365d3a69136884b3cf15e2cc9
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
