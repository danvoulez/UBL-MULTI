# Sync With UBL-CORE

## Manual Sync

Update to latest core `main`:
```bash
make core-sync-main
git commit -m "chore(core): sync submodule to latest main"
```

Pin to a specific core tag:
```bash
make core-sync-tag TAG=v0.1.0
git commit -m "chore(core): pin submodule to v0.1.0"
```

## Validation
After sync:
```bash
make multi-test
make multi-kat
```

## Recommended Release Discipline
- Development: track upstream `main`.
- Production: pin to signed release tags.
- Always attach submodule SHA in release notes.

## Automated Sync
- Scheduled workflow syncs `vendor/ubl-core` to `main`.
- Manual workflow dispatch supports:
  - `track=main` for dev cadence
  - `track=tag` + `tag=vX.Y.Z` for production pinning
- Every sync opens a PR for review.
