# Put certificate manager users in the appropriate group
resource "aws_iam_user_group_membership" "certificate_managers" {
  provider = aws.users

  for_each = toset(var.users)

  user = data.aws_iam_user.users[each.key].user_name

  groups = [
    aws_iam_group.certificate_managers.name
  ]
}
