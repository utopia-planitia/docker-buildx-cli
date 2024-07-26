FROM docker:27.1.1@sha256:a690693976550aba640859bb3c3c29eb323a4f53f684c99b2a8282b14a22308b AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.16.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.1.1@sha256:a690693976550aba640859bb3c3c29eb323a4f53f684c99b2a8282b14a22308b
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
