FROM docker:25.0.5@sha256:b1ac36e3c085b33768515badcfbc3cd2b7469bd2f5973a744dd27ea7d9167fa5 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.13.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.5@sha256:b1ac36e3c085b33768515badcfbc3cd2b7469bd2f5973a744dd27ea7d9167fa5
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
