resource "aws_iam_role" "Daily_AMI_backup_role" {
  name               = "Daily_AMI_backup_role_for_lambda"
  path = "/"
  assume_role_policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "lambda.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": "test1"
        }
      ]
    }
    EOF
    }

# Attached IAM Role and the new created Policy
resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = "Daily_AMI_backup_role_for_lambda"
  policy_arn = "arn:aws:iam::528129584174:policy/lambda_daily_AMI_backup_policy"
}
