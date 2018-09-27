ARG CONSOLE_VERSION=v4.0.0
ARG ALPINE_VERSION=3.8

FROM alpine:${ALPINE_VERSION} AS alpine
FROM quay.io/openshift/origin-console:${CONSOLE_VERSION} AS origin-console-official

FROM alpine AS origin-console
COPY --from=origin-console-official /opt/bridge/bin/bridge /bin/bridge
COPY --from=origin-console-official /opt/bridge/static /opt/bridge/static
ENV BRIDGE_PUBLIC_DIR=/opt/bridge/static
ENTRYPOINT ["bridge"]
