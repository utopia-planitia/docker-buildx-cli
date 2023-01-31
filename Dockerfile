FROM docker:20.10.23@sha256:919061b7f4ec6cce50f40a6a7ee93c1f902812fabaede2fb5108a4e1d1601ab6 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.23@sha256:919061b7f4ec6cce50f40a6a7ee93c1f902812fabaede2fb5108a4e1d1601ab6
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
