FROM docker:26.1.3@sha256:76ba10a4aed708c7b2db09d45740d711edf707f7368f6808bd32a53eaed33404 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.14.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.3@sha256:76ba10a4aed708c7b2db09d45740d711edf707f7368f6808bd32a53eaed33404
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
