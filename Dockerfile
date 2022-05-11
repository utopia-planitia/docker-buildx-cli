FROM docker:20.10.15@sha256:d11ece2878a6f8efbced93964e6ae22aa21721bc0efd9ef2e7e28685859d49d9 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.15@sha256:d11ece2878a6f8efbced93964e6ae22aa21721bc0efd9ef2e7e28685859d49d9
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
