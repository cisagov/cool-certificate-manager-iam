# cool-certificate-manager-iam #

[![GitHub Build Status](https://github.com/cisagov/cool-certificate-manager-iam/workflows/build/badge.svg)](https://github.com/cisagov/cool-certificate-manager-iam/actions)

This project is used to manage IAM permissions for COOL users that are
allowed to
[create](https://github.com/cisagov/cool-system/wiki/Creating-a-COOL-Certificate)
and
[renew](https://github.com/cisagov/cool-system/wiki/Renewing-a-COOL-Certificate)
COOL certificates.

## Pre-requisites ##

- [Terraform](https://www.terraform.io/) installed on your system.
- An accessible AWS S3 bucket to store Terraform state
  (specified in [backend.tf](backend.tf)).
- An accessible AWS DynamoDB database to store the Terraform state lock
  (specified in [backend.tf](backend.tf)).
- Access to all of the Terraform remote states specified in
  [remote_states.tf](remote_states.tf).
- User accounts for all users must have been created previously.  We
  recommend using the
  [`cisagov/cool-users-non-admin`](https://github.com/cisagov/cool-users-non-admin)
  repository to create users.
- Terraform in
  [`cisagov/cool-dns-certboto`](https://github.com/cisagov/cool-dns-certboto)
  must have been applied.
- Terraform in
  [`cisagov/cool-dns-cyber.dhs.gov`](https://github.com/cisagov/cool-dns-cyber.dhs.gov)
  must have been applied.

## Usage ##

1. Create a Terraform workspace (if you haven't already done so) by running
   `terraform workspace new <workspace_name>`
1. Create a `<workspace_name>.tfvars` file with all of the required
  variables (see [Inputs](#Inputs) below for details):

  ```hcl
  users = [
    "firstname1.lastname1",
    "firstname2.lastname2"
  ]
  ```

1. Run the command `terraform init`.
1. Run the command `terraform apply
  -var-file=<workspace_name>.tfvars`.

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~> 3.38 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.38 |
| aws.users | ~> 3.38 |
| terraform | n/a |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_group.certificate_managers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.assume_dns_certificatesbucketfullaccess_role_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.assume_dns_route53resourcechange_cyber_dhs_gov_role_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.assume_dns_certificatesbucketfullaccess_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.assume_dns_route53resourcechange_cyber_dhs_gov_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user_group_membership.certificate_managers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_dns_certificatesbucketfullaccess_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_dns_route53resourcechange_cyber_dhs_gov_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_user.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_user) | data source |
| [terraform_remote_state.dns_certboto](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.dns_cyber_dhs_gov](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.users](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| assume\_dns\_certificatesbucketfullaccess\_policy\_description | The description to associate with the IAM policy that allows assumption of the role that allows full access to the certificates bucket in the DNS account. | `string` | `"The IAM policy that allows assumption of the role that allows full access to the certificates bucket in the DNS account."` | no |
| assume\_dns\_certificatesbucketfullaccess\_policy\_name | The name to assign the IAM policy that allows assumption of the role that allows full access to the certificates bucket in the DNS account. | `string` | `"DNS-AssumeCertificatesBucketFullAccess"` | no |
| assume\_dns\_route53resourcechange\_cyber\_dhs\_gov\_policy\_description | The description to associate with the IAM policy that allows assumption of the role that allows sufficient permissions to modify resource records in the cyber.dhs.gov zone in the DNS account. | `string` | `"The IAM policy that allows assumption of the role that allows sufficient permissions to modify resource records in the cyber.dhs.gov zone in the DNS account."` | no |
| assume\_dns\_route53resourcechange\_cyber\_dhs\_gov\_policy\_name | The name to assign the IAM policy that allows assumption of the role that allows sufficient permissions to modify resource records in the cyber.dhs.gov zone in the DNS account. | `string` | `"DNS-AssumeRoute53ResourceChange-cyber.dhs.gov"` | no |
| aws\_region | The AWS region to deploy into (e.g. us-east-1). | `string` | `"us-east-1"` | no |
| certificate\_managers\_group\_name | The name of the group to be created for certificate manager users. | `string` | `"certificate_managers"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |
| users | A list containing the usernames of each user that is allowed to manage certificates.  Example: [ "firstname1.lastname1", "firstname2.lastname2" ]. | `list(string)` | n/a | yes |

## Outputs ##

No outputs.

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, this is just the main directory.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
