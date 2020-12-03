#!/bin/sh

echo "type: Mesh
name: poc1
logging:
  defaultBackend: file
  backends:
  - name: file
    type: file
    conf:
      path: /tmp/ServiceMesh/poc1/access.log" | kumactl apply -f -

echo "type: TrafficLog
name: all-traffic
mesh: poc
sources:
  - match:
      kuma.io/service: '*'
destinations:
  - match:
      kuma.io/service: '*'
conf:
  backend: file" | kumactl apply -f -
