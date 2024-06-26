FROM docker:27.0.1@sha256:2416984b43dd60adc38aac16ac0f6a49d71f197c096d425b31c37a6164558765 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.15.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.0.1@sha256:2416984b43dd60adc38aac16ac0f6a49d71f197c096d425b31c37a6164558765
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
