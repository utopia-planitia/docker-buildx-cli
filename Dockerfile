FROM docker:25.0.4@sha256:19a2619f1285f127e20923578299cf42407c347872409fff6f8b90b386d5130f AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.13.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.4@sha256:19a2619f1285f127e20923578299cf42407c347872409fff6f8b90b386d5130f
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
