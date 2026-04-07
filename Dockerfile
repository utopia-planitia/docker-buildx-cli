FROM docker:29.4.0@sha256:f80c26212befc1c1988b529495532c6b9180d9b1dab1611f4a1efbe9da8ec821 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.33.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.4.0@sha256:f80c26212befc1c1988b529495532c6b9180d9b1dab1611f4a1efbe9da8ec821
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
