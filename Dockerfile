FROM docker:27.2.0@sha256:d1d6d5265119696d8fa9b883f813953c560c5d87ea128a57681239b576f62997 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.16.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.2.0@sha256:d1d6d5265119696d8fa9b883f813953c560c5d87ea128a57681239b576f62997
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
