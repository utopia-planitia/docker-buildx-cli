FROM docker:20.10.13@sha256:9e13118c8f7b17349e2d350806082fdda135ebf2923376821f3eac23559b9141 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.13@sha256:9e13118c8f7b17349e2d350806082fdda135ebf2923376821f3eac23559b9141
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
