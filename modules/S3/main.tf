
resource "aws_s3_bucket" "dynamodb_S3_backup" {
 bucket = "my-dynamodb-backup-bucket"
    tags = {
    Name = "DynamoDBBackups"
  }
}


# resource "aws_s3_bucket_policy" "dynamodb_backup_policy" {
#   bucket = aws_s3_bucket.dynamodb_backup.id

#   policy = <<POLICY
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Principal": {
#                 "AWS": "arn:aws:iam::your-friend-account-id:role/dynamodb-backup-role"
#             },
#             "Action": "s3:PutObject",
#             "Resource": "${aws_s3_bucket.dynamodb_backup.arn}/*"
#         },
#         {
#             "Effect": "Allow",
#             "Principal": {
#                 "AWS": "arn:aws:iam::aws-account-id:root"  # Allows DynamoDB service to put backups
#             },
#             "Action": "s3:PutObject",
#             "Resource": "${aws_s3_bucket.dynamodb_backup.arn}/*"
#         }
#     ]
# }
# POLICY
# }



# resource "aws_cloudwatch_event_rule" "daily_backup" {
#   name        = "daily-dynamodb-backup"
#   description = "Trigger DynamoDB backup at the end of each day"

#   # Cron expression to trigger every day at midnight (UTC time)
#   schedule_expression = "cron(0 0 * * ? *)"
# }


# resource "aws_cloudwatch_event_target" "daily_backup_lambda" {
#   rule      = aws_cloudwatch_event_rule.daily_backup.name
#   target_id = "dynamodb_backup_lambda"
#   arn       = aws_lambda_function.dynamodb_backup_lambda.arn
# }


# resource "aws_lambda_permission" "allow_event_rule" {
#   statement_id  = "AllowExecutionFromCloudWatchEvents"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.dynamodb_backup_lambda.function_name
#   principal     = "events.amazonaws.com"
#   source_arn    = aws_cloudwatch_event_rule.daily_backup.arn
# }

# resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
#   alarm_name          = "high-cpu-usage"
#   comparison_operator = "GreaterThanThreshold"
#   evaluation_periods  = 1
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = 300  # 5 minutes (300 seconds)
#   statistic           = "Average"
#   threshold           = 90   # 90% CPU utilization
#   dimensions = {
#     InstanceId = "<Your EC2 Instance ID>"
#   }

#   alarm_actions = [
#     aws_lambda_function.dynamodb_backup_lambda.arn,
#   ]
# }

# resource "aws_lambda_permission" "allow_cloudwatch_alarm" {
#   statement_id  = "AllowExecutionFromCloudWatchAlarm"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.dynamodb_backup_lambda.function_name
#   principal     = "cloudwatch.amazonaws.com"
# }