
output "athena_output_bucket" {
  value = module.athena.athena_s3_bucket
}

output "athena_workgroup_name" {
  value = module.athena.athena_workgroup
}
