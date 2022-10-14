FROM docker:20.10.19@sha256:c46d545416789939b360195c8c870277c2c18481e130d16d1bde31bdf1cbe3c9 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.19@sha256:c46d545416789939b360195c8c870277c2c18481e130d16d1bde31bdf1cbe3c9
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
