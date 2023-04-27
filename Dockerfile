FROM docker:23.0.5@sha256:f23f0a4013f184f6af3a3892dd12eba74bdbc5988d2a54ae468a8a6a44078434 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.5@sha256:f23f0a4013f184f6af3a3892dd12eba74bdbc5988d2a54ae468a8a6a44078434
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
