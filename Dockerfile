FROM docker:20.10.14@sha256:6d51c80ff60c5af6672cd56b99a19bee907503fbb5602e2d89d82c529029afef AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.14@sha256:6d51c80ff60c5af6672cd56b99a19bee907503fbb5602e2d89d82c529029afef
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
