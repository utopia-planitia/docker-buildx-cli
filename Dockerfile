FROM docker:28.1.0@sha256:dbd0882bf05e6225bc64c35308f5234a33c511dd38d333ff422a9cd8aa3840dc AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.23.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.1.0@sha256:dbd0882bf05e6225bc64c35308f5234a33c511dd38d333ff422a9cd8aa3840dc
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
