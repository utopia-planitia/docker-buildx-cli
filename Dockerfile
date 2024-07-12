FROM docker:27.0.3@sha256:766677799446842639ffa7b88249dc69406bcf5b6c5d9f31d45557654f44b6b1 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.16.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.0.3@sha256:766677799446842639ffa7b88249dc69406bcf5b6c5d9f31d45557654f44b6b1
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
