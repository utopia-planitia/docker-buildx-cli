FROM docker:26.1.2@sha256:c890c327e515cdccd14e593fb5450e4375e791ab0520795948134cb87b45aaa7 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.14.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.2@sha256:c890c327e515cdccd14e593fb5450e4375e791ab0520795948134cb87b45aaa7
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
