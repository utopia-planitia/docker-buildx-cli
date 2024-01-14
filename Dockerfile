FROM docker:24.0.7@sha256:b42e6e3883fc20a6a98eda330b6a2b0a5efb3ca4c121bf7be154447904d199e8 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.7@sha256:b42e6e3883fc20a6a98eda330b6a2b0a5efb3ca4c121bf7be154447904d199e8
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
