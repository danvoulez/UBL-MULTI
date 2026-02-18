# UBL-MULTI

Multiplatform distribution layer for UBL, with `UBL-CORE` as single source of truth.

This repository is intentionally thin:
- Product/operator packaging for third-party use.
- Runtime defaults for API/MCP-facing operation.
- Automation to keep `vendor/ubl-core` synchronized.

All core logic (pipeline, canon, VM, receipts, trust model) must live in:
- `vendor/ubl-core` (Git submodule)

## Architecture Rule
- `UBL-CORE` first.
- `UBL-MULTI` never forks core logic.
- Any behavioral/core fix is implemented in `UBL-CORE`, then pulled here.

## Structure
- `vendor/ubl-core/` - pinned upstream core reference.
- `docs/` - multiplatform operating model.
- `.github/workflows/` - CI and core-sync automation.
- `Makefile` - common operator commands.

## Quick Start
```bash
cp .env.multi.sample .env
make multi-build
make multi-run
```

## Sync With Core
```bash
make core-sync-main   # move submodule to latest main
make core-sync-tag TAG=v0.1.0
```

Automation:
- `sync-core.yml` opens PRs syncing `vendor/ubl-core` (main on schedule, tag via manual dispatch).
- `canary.yml` runs a core-only runtime smoke test on PRs.

## Third-Party Surface
Default mode enables extension APIs for partner integration:
- API: `/v1/chips`, `/v1/receipts/*`, `/v1/events*`
- MCP/WebMCP: `/mcp/*`, `/.well-known/webmcp.json`
- Advisor/Audit endpoints (when enabled by env)

See `docs/THIRD_PARTY_SURFACE.md`.
