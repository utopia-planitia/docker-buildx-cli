FROM docker:24.0.2@sha256:28c6ddb5d7bfdc019fb39cc2797351a6e3e81458ad621808e5e9dd3e41538c77 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.2@sha256:28c6ddb5d7bfdc019fb39cc2797351a6e3e81458ad621808e5e9dd3e41538c77
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
