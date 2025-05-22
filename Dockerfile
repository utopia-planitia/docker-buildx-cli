FROM docker:28.1.1@sha256:e293493ad0083add2d14827c8b452b1da625745edd3cba27f154d0b11d0ec2d2 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.24.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.1.1@sha256:e293493ad0083add2d14827c8b452b1da625745edd3cba27f154d0b11d0ec2d2
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
