FROM docker.io/library/alpine:3.8 AS origin-console
COPY --from=quay.io/openshift/origin-console:v4.0.0 /opt/bridge/bin/bridge /bin/bridge
COPY --from=quay.io/openshift/origin-console:v4.0.0 /opt/bridge/static /opt/bridge/static
ENV BRIDGE_PUBLIC_DIR=/opt/bridge/static
ENTRYPOINT ["bridge"]
