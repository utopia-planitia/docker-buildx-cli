FROM docker:27.3.1@sha256:2711aa74a49d0f58233c41b6f3513e7aaa4b54f2aab0858cb3430f032bc169be AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.19.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.3.1@sha256:2711aa74a49d0f58233c41b6f3513e7aaa4b54f2aab0858cb3430f032bc169be
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
