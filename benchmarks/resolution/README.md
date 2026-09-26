# resolution

Every registry module costs a round trip to registry.terraform.io, and
`PageModuleService` takes them one at a time.

`small.tf` has 10 registry modules and `large.tf` has 40, so the two together
show whether the cost is linear in module count. Every address here was
checked against the live registry: a fixture full of modules that do not
exist would measure the error path instead.

These are the slowest benchmarks in the suite by a distance, because the
time is round trips rather than work.
