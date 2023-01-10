FROM docker:20.10.22@sha256:75026b00c823579421c1850c00def301a6126b3f3f684594e51114c997f76467 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.22@sha256:75026b00c823579421c1850c00def301a6126b3f3f684594e51114c997f76467
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
