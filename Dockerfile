FROM docker:24.0.6@sha256:95c1bdb03ee2b92e2aeb682496928c61311aa63794fd5487922dfa81f704742e AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.6@sha256:95c1bdb03ee2b92e2aeb682496928c61311aa63794fd5487922dfa81f704742e
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
