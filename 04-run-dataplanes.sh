#!/bin/sh

echo "Starting dataplanes..."

echo "type: Dataplane
mesh: poc
name: server_dp
networking:
  address: 127.0.0.1
  inbound:
  - port: 8011
    servicePort: 8010
    tags:
      kuma.io/service: server_dp
      version: v0
      protocol: http" | kumactl apply -f -

kumactl generate dataplane-token --dataplane=server_dp > /tmp/ServiceMesh/poc1/server_dp-token

nohup kuma-dp run --name=server_dp \
--cp-address=http://localhost:5681 \
--mesh=poc\
--dataplane-token-file=/tmp/ServiceMesh/poc1/server_dp-token > /tmp/ServiceMesh/poc1/server-dp.log &

sleep 5

echo "type: Dataplane
mesh: poc
name: client_dp
networking:
  address: 127.0.0.1
  inbound:
  - port: 8021
    servicePort: 8020
    tags:
      kuma.io/service: client_dp
      version: v0
      protocol: http
  outbound:
  - port: 8030
    service: server_dp" | kumactl apply -f -


kumactl generate dataplane-token --dataplane=client_dp > /tmp/ServiceMesh/poc1/client_dp-token

nohup kuma-dp run --name=client_dp \
--cp-address=http://localhost:5681 \
--mesh=poc\
--dataplane-token-file=/tmp/ServiceMesh/poc1/client_dp-token > /tmp/ServiceMesh/poc1/client-dp.log &
