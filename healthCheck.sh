echo "type: HealthCheck
name: web-to-backend-check
mesh: poc
sources:
- match:
    kuma.io/service: client_dp
destinations:
- match:
    kuma.io/service: server_dp
conf:
  interval: 10s
  timeout: 2s
  unhealthyThreshold: 3
  healthyThreshold: 1
  activeChecks:
    interval: 10s
    timeout: 2s
    unhealthyThreshold: 3
    healthyThreshold: 1
  passiveChecks:
    unhealthyThreshold: 3
    penaltyInterval: 5s" | kumactl apply -f -
