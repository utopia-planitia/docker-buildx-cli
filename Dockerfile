FROM docker:20.10.17@sha256:aa9895439568ab56e3a8eb14a86edfd789c9647b9e87685ea847492271bd61f7 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.17@sha256:aa9895439568ab56e3a8eb14a86edfd789c9647b9e87685ea847492271bd61f7
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
