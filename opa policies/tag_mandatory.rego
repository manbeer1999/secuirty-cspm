package terraform.tags

deny[msg] {
  input.resource.values.tags == null
  msg := sprintf("Resource %s missing mandatory tags", [input.resource.address])
}
