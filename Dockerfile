FROM docker:25.0.3@sha256:915cd1624f521b6337f135075f712c8fb14c0b151595c6144d7ce05d2f257869 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.3@sha256:915cd1624f521b6337f135075f712c8fb14c0b151595c6144d7ce05d2f257869
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
