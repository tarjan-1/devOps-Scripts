# version: v1
# Author: Tarjan Bawankule
# description: This script will report the AWS resourse usage

# setting script in debug mode
set -x

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# Redirect all output to a file
exec > aws_usage_report.log 2>&1

# list s3 buckets
echo "Print list s3 buckets"
aws s3 ls

# list ec2 instances
echo "Print list ec2 instances"
aws ec2 describe-instances | jq ".Reservations[].Instances[].InstanceId"

# list lambda functions
echo "Print list lambda functions"
aws lambda list-functions

# list iam users
echo "Print list iam users"
aws iam list-users


# crontab -e
# 0 6 * * * /usr/local/bin/aws_usage_report.sh
