FROM docker:26.1.1@sha256:56e2c522194d81689c2787c76304777199cbdc741d7dd798d06e33967361d92f AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.14.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.1@sha256:56e2c522194d81689c2787c76304777199cbdc741d7dd798d06e33967361d92f
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
