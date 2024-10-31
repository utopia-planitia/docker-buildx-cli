FROM docker:27.3.1@sha256:bda6cf6ae93dd0e40089a03e8215fbb9f4ddf0e344b7c577a484ebdaa34adceb AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.17.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.3.1@sha256:bda6cf6ae93dd0e40089a03e8215fbb9f4ddf0e344b7c577a484ebdaa34adceb
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
