# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "terraform_state_bucket" {
  description = "The name of the S3 bucket where Terraform state is stored."
  nullable    = false
  type        = string
}

variable "users" {
  description = "A list containing the usernames of each user that is allowed to manage certificates.  Example: [ \"firstname1.lastname1\", \"firstname2.lastname2\" ]."
  nullable    = false
  type        = list(string)
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "assume_dns_certificatesbucketfullaccess_policy_description" {
  default     = "The IAM policy that allows assumption of the role that allows full access to the certificates bucket in the DNS account."
  description = "The description to associate with the IAM policy that allows assumption of the role that allows full access to the certificates bucket in the DNS account."
  nullable    = false
  type        = string
}

variable "assume_dns_certificatesbucketfullaccess_policy_name" {
  default     = "DNS-AssumeCertificatesBucketFullAccess"
  description = "The name to assign the IAM policy that allows assumption of the role that allows full access to the certificates bucket in the DNS account."
  nullable    = false
  type        = string
}

variable "assume_dns_route53resourcechange_cyber_dhs_gov_policy_description" {
  default     = "The IAM policy that allows assumption of the role that allows sufficient permissions to modify resource records in the cyber.dhs.gov zone in the DNS account."
  description = "The description to associate with the IAM policy that allows assumption of the role that allows sufficient permissions to modify resource records in the cyber.dhs.gov zone in the DNS account."
  nullable    = false
  type        = string
}

variable "assume_dns_route53resourcechange_cyber_dhs_gov_policy_name" {
  default     = "DNS-AssumeRoute53ResourceChange-cyber.dhs.gov"
  description = "The name to assign the IAM policy that allows assumption of the role that allows sufficient permissions to modify resource records in the cyber.dhs.gov zone in the DNS account."
  nullable    = false
  type        = string
}

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region to deploy into (e.g. us-east-1)."
  nullable    = false
  type        = string
}

variable "certificate_managers_group_name" {
  default     = "certificate_managers"
  description = "The name of the group to be created for certificate manager users."
  nullable    = false
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  nullable    = false
  type        = map(string)
}
