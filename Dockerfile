FROM docker:26.1.4@sha256:d8714cbec5b4eae1cc2fa241d8c773f828cfe864de56222f798569f2251f7a04 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.15.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.4@sha256:d8714cbec5b4eae1cc2fa241d8c773f828cfe864de56222f798569f2251f7a04
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
