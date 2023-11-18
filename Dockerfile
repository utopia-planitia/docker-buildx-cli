FROM docker:24.0.7@sha256:39920e7f8b71f33db3d145a1fb1fa8349ae97cc6dd64b738a2b77e9eddbd9999 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.7@sha256:39920e7f8b71f33db3d145a1fb1fa8349ae97cc6dd64b738a2b77e9eddbd9999
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
