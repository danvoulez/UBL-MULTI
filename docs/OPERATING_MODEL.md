# Operating Model

`UBL-MULTI` is a product/integration shell around `UBL-CORE`.

## Source Of Truth
- Core behavior is defined exclusively by `vendor/ubl-core`.
- `UBL-MULTI` owns deployment profile, integrations, partner-facing defaults.

## Change Flow
1. Core behavior change needed.
2. Implement and merge in `UBL-CORE`.
3. Sync submodule commit in `UBL-MULTI`.
4. Run `multi-test` + `multi-kat`.
5. Release.

## Non-Negotiable Rule
No direct edits under `vendor/ubl-core` in this repository.
All edits there are made upstream first.
