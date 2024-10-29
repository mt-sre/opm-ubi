# stage 1: copy opm + grpc_health_probe from regular opm image
FROM quay.io/operator-framework/opm:v1.45.0 as opm

# stage 2: output UBI image
FROM quay.io/app-sre/ubi8-ubi:8.10

# OPM requirements for a base image: https://github.com/operator-framework/operator-registry/blob/master/alpha/action/generate_dockerfile.go#L42-L63
COPY --from=opm /bin/opm /bin/opm
COPY --from=opm /bin/grpc_health_probe /bin/grpc_health_probe
