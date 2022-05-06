FROM docker:20.10.15@sha256:462f7ada37612b16adf56972b362b60c488861670b906a42e7a84319f2d1ff23 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.15@sha256:462f7ada37612b16adf56972b362b60c488861670b906a42e7a84319f2d1ff23
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
