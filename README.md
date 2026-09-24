# iac-module-linker-fixtures

Test fixtures for [iac-module-linker](https://github.com/NickSpaghetti/iac-module-linker).

Every file here is **valid HCL** exercising one family of module source
addresses. It is deliberately **not a valid Terraform configuration** - many
sources point at hosts that do not exist. Do not run `tofu init` or
`terraform init` against it.

## Stable references

The linker's tests assert that generated links actually resolve, so these
must not be deleted or renamed:

| Ref | Purpose |
|-----|---------|
| `main` | default branch |
| `v1.0.0` | tag, for `?ref=` / `?tag=` resolution |
| `modules/vpc/` | directory target - link should use `tree` |
| `modules/vpc/main.tf` | file target - link should use `blob` |
| `nested/deep/consumer.tf` | deep file, for `../../` relative resolution |

## Expectations

Expected classifications live in the linker repo, not here. Fixtures stay
stable; expectations change as the classifier improves.
