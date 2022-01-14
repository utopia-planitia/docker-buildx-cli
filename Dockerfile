FROM docker:20.10.10@sha256:ef7bb7fae023a1c895370ace48e3f4d470fe2351752565cdf4b3488ecb4a1fa8 AS download
RUN apk add curl
ENV BUILDX_VERSION = v0.7.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.10@sha256:ef7bb7fae023a1c895370ace48e3f4d470fe2351752565cdf4b3488ecb4a1fa8
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from download /docker-buildx ~/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
