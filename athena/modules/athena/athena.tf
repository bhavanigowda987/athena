
resource "aws_s3_bucket" "athena_output" {
  bucket = var.athena_s3_bucket
  force_destroy = true
}

resource "aws_glue_catalog_database" "athena_db" {
  name = "athena_sample_db"
}

resource "aws_athena_workgroup" "athena_workgroup" {
  name = "athena_workgroup"

  configuration {
    result_configuration {
      output_location = "s3://${aws_s3_bucket.athena_output.bucket}/query-results/"
    }
  }
}

output "athena_s3_bucket" {
  value = aws_s3_bucket.athena_output.bucket
}

output "athena_workgroup" {
  value = aws_athena_workgroup.athena_workgroup.name
}
