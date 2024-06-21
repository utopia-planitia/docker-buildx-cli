FROM docker:26.1.4@sha256:3bdcaf5c123db3bfc2810c5e811367a1c56442e467b924ff0cbbf7946e0d90ae AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.15.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.4@sha256:3bdcaf5c123db3bfc2810c5e811367a1c56442e467b924ff0cbbf7946e0d90ae
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
