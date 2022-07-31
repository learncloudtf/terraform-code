# Created Policy for IAM Role (ec2 and log access)
resource "aws_iam_policy" "lambda_daily_backup_policy" {
  name = "lambda_daily_AMI_backup_policy"
  description = "None"
  policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "VisualEditor0",
              "Effect": "Allow",
              "Action": "ec2:DeleteSnapshot",
              "Resource": "arn:aws:ec2:ap-southeast-1::snapshot/*"
          },
          {
              "Sid": "VisualEditor1",
              "Effect": "Allow",
              "Action": "ec2:CreateTags",
              "Resource": "arn:aws:ec2:ap-southeast-1::image/*"
          },
          {
              "Sid": "VisualEditor2",
              "Effect": "Allow",
              "Action": [
                  "ec2:DescribeImages",
                  "ec2:DeregisterImage",
                  "logs:CreateLogStream",
                  "ec2:DescribeInstances",
                  "ec2:DescribeInstanceAttribute",
                  "ec2:DescribeTags",
                  "ec2:CreateImage",
                  "logs:CreateLogGroup",
                  "logs:PutLogEvents",
                  "ec2:DescribeInstanceStatus"
              ],
              "Resource": "*"
          }
      ]
}
EOF
}
