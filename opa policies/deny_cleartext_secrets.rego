package terraform.deny_cleartext_secrets

deny[msg] {
  input.resource.type == "aws_ssm_parameter"
  input.resource.values.type == "String"
  msg := sprintf("SSM Parameter %s must be SecureString", [input.resource.values.name])
}
