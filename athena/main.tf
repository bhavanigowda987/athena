
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "iam" {
  source = "./modules/iam"
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
}

module "athena" {
  source          = "./modules/athena"
  athena_s3_bucket = "athena-query-results-${random_id.rand.hex}"
}

resource "random_id" "rand" {
  byte_length = 4
}
