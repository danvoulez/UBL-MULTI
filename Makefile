.PHONY: multi-build multi-test multi-kat multi-run multi-run-core-only docs-check core-sync-main core-sync-tag

TAG ?= v0.1.0

multi-build:
	cargo build --manifest-path vendor/ubl-core/Cargo.toml --workspace

multi-test:
	cargo test --manifest-path vendor/ubl-core/Cargo.toml --workspace

multi-kat:
	$(MAKE) -C vendor/ubl-core core-kat

multi-run:
	REQUIRE_UNC1_NUMERIC=true F64_IMPORT_MODE=reject \
	UBL_FEATURE_AUDIT_ENABLED=true UBL_FEATURE_ADVISOR_ENABLED=true UBL_FEATURE_MCP_ENABLED=true \
	cargo run --manifest-path vendor/ubl-core/Cargo.toml -p ubl_gate

multi-run-core-only:
	REQUIRE_UNC1_NUMERIC=true F64_IMPORT_MODE=reject \
	UBL_FEATURE_AUDIT_ENABLED=false UBL_FEATURE_ADVISOR_ENABLED=false UBL_FEATURE_MCP_ENABLED=false \
	cargo run --manifest-path vendor/ubl-core/Cargo.toml -p ubl_gate

docs-check:
	python3 vendor/ubl-core/scripts/ci/check_docs.py

core-sync-main:
	cd vendor/ubl-core && git fetch origin && git checkout main && git pull --ff-only origin main
	git add vendor/ubl-core
	@echo "Submodule moved to latest origin/main. Commit in UBL-MULTI to persist."

core-sync-tag:
	cd vendor/ubl-core && git fetch --tags origin && git checkout $(TAG)
	git add vendor/ubl-core
	@echo "Submodule moved to tag $(TAG). Commit in UBL-MULTI to persist."
