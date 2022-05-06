resource "aws_iam_user" "users" {
  name = var.project-devops-users[count.index]
  count = length(var.project-devops-users)
  tags = {
      Description = "User ${count.index}"
  }
}