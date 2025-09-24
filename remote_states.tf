# ------------------------------------------------------------------------------
# Retrieves state data from a Terraform backend. This allows use of the
# root-level outputs of one or more Terraform configurations as input data
# for this configuration.
# ------------------------------------------------------------------------------

data "terraform_remote_state" "dns_certboto" {
  backend = "s3"

  config = {
    bucket         = var.terraform_state_bucket
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-dns-certboto/terraform.tfstate"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
  }

  workspace = terraform.workspace
}

data "terraform_remote_state" "dns_cyber_dhs_gov" {
  backend = "s3"

  config = {
    bucket         = var.terraform_state_bucket
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-dns-cyber.dhs.gov.tfstate"
    profile        = "cool-terraform-readstate"
    region         = "us-east-1"
  }

  workspace = terraform.workspace
}

data "terraform_remote_state" "users" {
  backend = "s3"

  config = {
    bucket         = var.terraform_state_bucket
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-accounts/users.tfstate"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
  }

  workspace = terraform.workspace
}
