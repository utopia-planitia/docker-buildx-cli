FROM docker:24.0.5@sha256:b1f43c30e065966611cf5e38012fda2145bc08b01082fa102296957d77c2cb4c AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.5@sha256:b1f43c30e065966611cf5e38012fda2145bc08b01082fa102296957d77c2cb4c
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
