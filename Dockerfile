FROM docker:27.4.1@sha256:2f797192a5e136d695e31de34f88d1e5db81777d1127bc563a7930f530d96f8f AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.19.3
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.4.1@sha256:2f797192a5e136d695e31de34f88d1e5db81777d1127bc563a7930f530d96f8f
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
