# Release Checklist

Use this checklist for each `UBL-MULTI` release.

## Pre-Release

1. Sync `vendor/ubl-core` to intended ref/tag.
2. Run:
   - `make multi-build`
   - `make multi-test`
   - `make multi-kat`
3. Confirm runtime mode (core-only or partner surface) and env defaults.
4. Review `docs/THIRD_PARTY_SURFACE.md` for endpoint accuracy.

## CI Requirements

1. `ci.yml` passes.
2. `canary.yml` smoke path passes.
3. `sync-core.yml` remains green for manual dispatch.

## Artifact + Notes

1. Tag release with clear version (`vX.Y.Z`).
2. Include in release notes:
   - core submodule commit SHA
   - enabled profile assumptions
   - operational changes (flags/routes/limits)
3. Link rollback ref/tag.

## Rollback Plan

1. Checkout previous known-good tag.
2. Redeploy with same env profile.
3. Re-run smoke and contract checks.
