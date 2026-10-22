FROM docker:29.9.2@sha256:9e79b879b177fbd72c34376a3dd3d91747da5db49e1f560f76aea59561471977 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.38.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.9.2@sha256:9e79b879b177fbd72c34376a3dd3d91747da5db49e1f560f76aea59561471977
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
