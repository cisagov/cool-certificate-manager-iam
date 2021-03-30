# An IAM group for certificate managers
resource "aws_iam_group" "certificate_managers" {
  provider = aws.users

  name = var.certificate_managers_group_name
}
