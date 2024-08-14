FROM docker:27.1.2@sha256:2f1bfc489d160c04e5fc1cbc76d1f425bd914b3f4eb4cd39123d7aa3cd7c5925 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.16.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.1.2@sha256:2f1bfc489d160c04e5fc1cbc76d1f425bd914b3f4eb4cd39123d7aa3cd7c5925
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
