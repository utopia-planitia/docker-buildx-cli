FROM docker:27.4.1@sha256:d33ffba5909705d375ef1a99bb69fe6e21d80482134283226b119acf18bb08b4 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.19.3
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.4.1@sha256:d33ffba5909705d375ef1a99bb69fe6e21d80482134283226b119acf18bb08b4
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
