FROM docker:24.0.2@sha256:1d148deae16a6bb4c89224c636e1fd1799a4d5925f545861ce0d7bea3a527b5d AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.2@sha256:1d148deae16a6bb4c89224c636e1fd1799a4d5925f545861ce0d7bea3a527b5d
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
