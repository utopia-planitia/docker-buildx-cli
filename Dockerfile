FROM docker:20.10.17@sha256:386dd216988a21c83233d32b3926300909a111fa73266d035e992280aa3a9e42 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.17@sha256:386dd216988a21c83233d32b3926300909a111fa73266d035e992280aa3a9e42
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
