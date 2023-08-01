FROM docker:24.0.5@sha256:25a7feece7050334e8bd478dc9b6031c24db7fe81b2665abe690698ec52074f2 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.5@sha256:25a7feece7050334e8bd478dc9b6031c24db7fe81b2665abe690698ec52074f2
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
