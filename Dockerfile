FROM docker:29.5.3@sha256:ad68e89b675740867a3bb96488a93fea9209ad36c6305bfba2664912d6dcf11a AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.34.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.5.3@sha256:ad68e89b675740867a3bb96488a93fea9209ad36c6305bfba2664912d6dcf11a
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
