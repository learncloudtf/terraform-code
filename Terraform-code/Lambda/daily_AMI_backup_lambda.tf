# Created AWS Lamdba Function: Memory Size, NodeJS version, handler, endpoint, doctype and environment settings
resource "aws_lambda_function" "AMI_backup_lambda" {
  function_name = "Daily_AMI_Backup_Lambda"
  description   = "This function will create AMI at 10 PM sgt"
  memory_size = 1024
  filename         = "lambda_function.zip"
  runtime          = "python3.8"
  role             = "arn:aws:iam::528129584174:role/Daily_AMI_backup_role_for_lambda"
  handler          = "lambda_function.lambda_handler"
  environment {
    variables = {
      TAG_KEY = "Backup"
      TAG_VALUE = "Yes"
      RETENTION = "10080"
      SIGNATURE = "_bkp-daily_"
    }
  }
}
