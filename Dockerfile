FROM docker:20.10.22@sha256:152d5e0d4421f0b77021ee58e6469fc25e474a1f6c50ef4d7e9f6b3d28c66149 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.22@sha256:152d5e0d4421f0b77021ee58e6469fc25e474a1f6c50ef4d7e9f6b3d28c66149
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
