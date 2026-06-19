FROM docker:29.6.0@sha256:7bb861a04bb42bda1d237fc2cb539f9823c9b666ecfbfdbd3e534ab74c8cb976 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.35.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.6.0@sha256:7bb861a04bb42bda1d237fc2cb539f9823c9b666ecfbfdbd3e534ab74c8cb976
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
