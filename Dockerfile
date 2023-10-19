FROM docker:24.0.6@sha256:0752ca4e936da012c173c119217c0f9599b3b191c1557e53206d5d06d2627580 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.6@sha256:0752ca4e936da012c173c119217c0f9599b3b191c1557e53206d5d06d2627580
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
