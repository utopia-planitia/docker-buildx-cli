FROM docker:28.0.4@sha256:4924fece44d61eeec47f619a4c35cd70fa2a31cd36b6283943a122369549fb82 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.22.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.0.4@sha256:4924fece44d61eeec47f619a4c35cd70fa2a31cd36b6283943a122369549fb82
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
