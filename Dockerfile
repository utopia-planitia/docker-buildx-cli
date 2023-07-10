FROM docker:24.0.4@sha256:1a3af94b15016bbe80ef221dfec5639c13a0ce1e08aaec40fffea1d1250aade0 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.4@sha256:1a3af94b15016bbe80ef221dfec5639c13a0ce1e08aaec40fffea1d1250aade0
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
