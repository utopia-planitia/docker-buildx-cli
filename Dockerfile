FROM docker:26.0.1@sha256:a2d55c6061a342e42db62654b7b7cdf16113828a80b3827cbd9453806c08549c AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.13.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.0.1@sha256:a2d55c6061a342e42db62654b7b7cdf16113828a80b3827cbd9453806c08549c
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
