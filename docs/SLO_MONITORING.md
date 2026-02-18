# SLO and Monitoring

Baseline operational targets for `UBL-MULTI`.

## Core Runtime SLOs

1. `POST /v1/chips` p95 under 300ms for simple chips.
2. Read endpoints p95 under 150ms (cache warm).
3. Replay/idempotency returns stable receipt for same command key.

## Feature Surface SLOs

1. `/v1/events` stream remains stable with backpressure enabled.
2. MCP routes return deterministic contract errors (no panic/500 drift).
3. Advisor/Audit disabled routes return clean feature-disabled errors.

## Minimum Monitoring Set

1. `healthz` uptime checks.
2. Error-rate by endpoint family (`/v1`, `/mcp`, advisor/audit).
3. p95 latency by stage or route group.
4. Restart count and crash loops.

## Alerting Triggers

1. 5xx rate spike above baseline.
2. Idempotency regression (same command returns different receipt).
3. Event stream disconnect spikes.
4. Repeated PM2 restarts for gate process.
