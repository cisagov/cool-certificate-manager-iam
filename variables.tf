# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "users" {
  type        = list(string)
  description = "A list containing the usernames of each user that is allowed to manage certificates.  Example: [ \"firstname1.lastname1\", \"firstname2.lastname2\" ]."
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "assume_dns_certificatesbucketfullaccess_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that allows assumption of the role that allows full access to the certificates bucket in the DNS account."
  default     = "The IAM policy that allows assumption of the role that allows full access to the certificates bucket in the DNS account."
}

variable "assume_dns_certificatesbucketfullaccess_policy_name" {
  type        = string
  description = "The name to assign the IAM policy that allows assumption of the role that allows full access to the certificates bucket in the DNS account."
  default     = "DNS-AssumeCertificatesBucketFullAccess"
}

variable "assume_dns_route53resourcechange_cyber_dhs_gov_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that allows assumption of the role that allows sufficient permissions to modify resource records in the cyber.dhs.gov zone in the DNS account."
  default     = "The IAM policy that allows assumption of the role that allows sufficient permissions to modify resource records in the cyber.dhs.gov zone in the DNS account."
}

variable "assume_dns_route53resourcechange_cyber_dhs_gov_policy_name" {
  type        = string
  description = "The name to assign the IAM policy that allows assumption of the role that allows sufficient permissions to modify resource records in the cyber.dhs.gov zone in the DNS account."
  default     = "DNS-AssumeRoute53ResourceChange-cyber.dhs.gov"
}

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "certificate_managers_group_name" {
  type        = string
  description = "The name of the group to be created for certificate manager users."
  default     = "certificate_managers"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created."
  default     = {}
}
