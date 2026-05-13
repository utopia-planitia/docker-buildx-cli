FROM docker:29.4.3@sha256:685b91dca8eab7de1dce1c303dbb7a763e4082d6a60db10968adf3295fbd2495 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.34.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.4.3@sha256:685b91dca8eab7de1dce1c303dbb7a763e4082d6a60db10968adf3295fbd2495
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
