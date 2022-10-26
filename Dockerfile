FROM docker:20.10.21@sha256:0e3e7e2033cf7779ab6985e24ad18d6ec415c9dd944acef5ca56119a3a0dda2e AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.21@sha256:0e3e7e2033cf7779ab6985e24ad18d6ec415c9dd944acef5ca56119a3a0dda2e
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
