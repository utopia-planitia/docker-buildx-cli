FROM docker:25.0.1@sha256:03efb9fcf2bcea4830221bfc711b08f62007666e55019222643a9fb9dc314bd6 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.1@sha256:03efb9fcf2bcea4830221bfc711b08f62007666e55019222643a9fb9dc314bd6
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
