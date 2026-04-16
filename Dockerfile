FROM docker:29.4.0@sha256:a6dd5322747a95cd8e3207bd8d415a8fd20ec34e9c00f06dc019cbd912013489 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.33.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.4.0@sha256:a6dd5322747a95cd8e3207bd8d415a8fd20ec34e9c00f06dc019cbd912013489
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
