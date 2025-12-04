FROM docker:29.1.2@sha256:40916fb078cdd27640d069bba401324a15a06d3ecbd8895048122c8d321f43f8 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.30.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.1.2@sha256:40916fb078cdd27640d069bba401324a15a06d3ecbd8895048122c8d321f43f8
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
