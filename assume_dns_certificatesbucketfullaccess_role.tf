# IAM policy document that allows assumption of the
# CertificatesBucketFullAccess role in the DNS account
data "aws_iam_policy_document" "assume_dns_certificatesbucketfullaccess_role_doc" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    resources = [
      data.terraform_remote_state.dns_certboto.outputs.certificatesbucketfullaccess_role.arn,
    ]
  }
}

resource "aws_iam_policy" "assume_dns_certificatesbucketfullaccess_role" {
  provider = aws.users

  description = var.assume_dns_certificatesbucketfullaccess_policy_description
  name        = var.assume_dns_certificatesbucketfullaccess_policy_name
  policy      = data.aws_iam_policy_document.assume_dns_certificatesbucketfullaccess_role_doc.json
}

# Attach the policy to the certificate managers group
resource "aws_iam_group_policy_attachment" "assume_dns_certificatesbucketfullaccess_role_attachment" {
  provider = aws.users

  group      = aws_iam_group.certificate_managers.name
  policy_arn = aws_iam_policy.assume_dns_certificatesbucketfullaccess_role.arn
}
