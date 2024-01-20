FROM docker:25.0.0@sha256:3c5c38804aab5d3938ea3aa5be399276bbb3b8e04a5190183aa01be55641518c AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.0@sha256:3c5c38804aab5d3938ea3aa5be399276bbb3b8e04a5190183aa01be55641518c
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
