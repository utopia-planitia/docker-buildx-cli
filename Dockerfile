FROM docker:29.4.1@sha256:c77e5d7912f9b137cc67051fdc2991d8f5ae22c55ddf532bb836dcb693a04940 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.33.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.4.1@sha256:c77e5d7912f9b137cc67051fdc2991d8f5ae22c55ddf532bb836dcb693a04940
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
