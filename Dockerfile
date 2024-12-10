FROM docker:27.4.0@sha256:dab507adbc215544974bccf6f1a7ee607db0e0a59b6bd3fde6f88b852b91810f AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.19.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.4.0@sha256:dab507adbc215544974bccf6f1a7ee607db0e0a59b6bd3fde6f88b852b91810f
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
