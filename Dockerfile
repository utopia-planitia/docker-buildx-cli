FROM docker:27.3.1@sha256:ccfd877fe10a2fe0cdb1f35c43aba2fed90007dbf7e0678b1951297c72296e8d AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.18.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.3.1@sha256:ccfd877fe10a2fe0cdb1f35c43aba2fed90007dbf7e0678b1951297c72296e8d
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
