FROM docker:26.1.4@sha256:dfaffff209798d9efe4ec07243d172ba8706918859c87869656a5d3091df44bb AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.15.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.4@sha256:dfaffff209798d9efe4ec07243d172ba8706918859c87869656a5d3091df44bb
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
