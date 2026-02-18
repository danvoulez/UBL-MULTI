# Third-Party Surface

This profile is intended for external consumers through API/MCP.

## Primary Endpoints
- `POST /v1/chips`
- `GET /v1/chips/:cid`
- `GET /v1/receipts/:cid`
- `GET /v1/receipts/:cid/trace`
- `GET /v1/events`
- `GET /v1/events/search`

## MCP Endpoints
- `GET /mcp/manifest`
- `GET /.well-known/webmcp.json`
- `POST /mcp/rpc`

## Optional Service Endpoints
- Advisor: `/v1/advisor/*`
- Audit: `/v1/audit/*`

## Profile
For partner-facing mode, defaults are:
- `UBL_FEATURE_MCP_ENABLED=true`
- `UBL_FEATURE_ADVISOR_ENABLED=true`
- `UBL_FEATURE_AUDIT_ENABLED=true`

For strict core-only mode, set all three flags to `false`.
