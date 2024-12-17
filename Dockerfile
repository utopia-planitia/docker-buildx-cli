FROM docker:27.4.0@sha256:716681c5596613d845dd7e3a1e5d79f2bff3108997e8d43c12c43940e4d53778 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.19.3
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.4.0@sha256:716681c5596613d845dd7e3a1e5d79f2bff3108997e8d43c12c43940e4d53778
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
