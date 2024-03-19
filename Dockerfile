FROM docker:25.0.4@sha256:92efb5a4c0e6e390e0418a26257787f10087aeffd8ebe13480c67e85a6f587aa AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.13.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.4@sha256:92efb5a4c0e6e390e0418a26257787f10087aeffd8ebe13480c67e85a6f587aa
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
