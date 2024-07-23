FROM docker:27.1.0@sha256:6c07360cee22246dc937aca251b8f092d54196524538384eae013425a439cfbf AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.16.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.1.0@sha256:6c07360cee22246dc937aca251b8f092d54196524538384eae013425a439cfbf
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
