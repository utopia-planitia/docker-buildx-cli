FROM docker:27.1.1@sha256:76f31b378efbad9be6ac2b368c966a2febf2fc268e002185bf97061f03ea412c AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.16.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.1.1@sha256:76f31b378efbad9be6ac2b368c966a2febf2fc268e002185bf97061f03ea412c
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
