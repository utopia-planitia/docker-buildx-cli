FROM docker:20.10.18@sha256:b2343859b009730168704bf04dd705291539db39df5ccf840a91b647b72009fe AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.18@sha256:b2343859b009730168704bf04dd705291539db39df5ccf840a91b647b72009fe
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
