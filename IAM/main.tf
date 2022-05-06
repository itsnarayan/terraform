resource "aws_iam_user" "admin-user1"{
    name = "arthi"
    tags = {
        Description = "Create new user using terraform "
    }
}

resource "aws_iam_policy" "adminUser1" {
  name = "AllEc2Permission2"
  policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "arthi-admin-access" {
    user = aws_iam_user.admin-user1.name
    policy_arn = aws_iam_policy.adminUser1.arn
  
}