FROM docker:28.3.2@sha256:5415fccf3da3aed821efb2258cb7dcf52fb9bb0627b02d45338e887c352c4bce AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.26.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.3.2@sha256:5415fccf3da3aed821efb2258cb7dcf52fb9bb0627b02d45338e887c352c4bce
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
