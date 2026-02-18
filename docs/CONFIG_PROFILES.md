# Configuration Profiles

This repository supports two stable operation profiles.

## 1) Core-Only Profile

Use when you want `UBL-MULTI` to behave like a strict `UBL-CORE` runtime.

```env
UBL_FEATURE_MCP_ENABLED=false
UBL_FEATURE_ADVISOR_ENABLED=false
UBL_FEATURE_AUDIT_ENABLED=false
```

Recommended for:
- Deterministic baseline testing.
- Core contract validation.
- Conservative production rollout.

## 2) Partner Surface Profile

Use when exposing API + MCP + extensions to third parties.

```env
UBL_FEATURE_MCP_ENABLED=true
UBL_FEATURE_ADVISOR_ENABLED=true
UBL_FEATURE_AUDIT_ENABLED=true
```

Recommended for:
- Partner integrations.
- MCP/WebMCP agent workflows.
- Advanced observability and advisory flows.

## Guardrails

- Keep `UBL-CORE` as behavior source of truth.
- Any behavior fix goes upstream first, then synced here.
- Avoid profile drift: record chosen profile in deployment notes.
