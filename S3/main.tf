resource "aws_s3_bucket" "finance" {
  bucket = "balance-sheet-20220507"
  tags = {
    "Desciption" = "Finance details"
  }
}

resource "aws_s3_bucket_object" "finance-2020" {
  content = "Welcome to finance"
  key     = "finance-2021.txt"
  bucket  = aws_s3_bucket.finance.id
}

data "aws_iam_group" "finance-data" {
  group_name = "finance-analyst"
}

resource "aws_s3_bucket_policy" "finance-policy" {
  bucket = aws_s3_bucket.finance.id
  policy = jsonencode(
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "*",
        "Effect": "Allow",
        "Resource": "arn:aws:s3:::${aws_s3_bucket.finance.id}/*",
        "Principal": "*"
      }   
    ] 
  }
 )
}