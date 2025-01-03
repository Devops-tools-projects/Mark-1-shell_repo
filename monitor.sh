#!/bin/bash

######################################
#author: sai kamalesh
#date:3/1/2025
#script to monitor the aws features#
#######################################

#to list the S3 buckets

echo "list the S3 Buckets"
aws s3 ls

#to list the ec2 instance

echo "list of ec2 instance"
aws ec2 describe-instances

#to list the lambda functions

echo "list of Lambda function"
aws lambda list-functions

#to list the iam users

echo "list of IAM users"
aws iam list-users


##This will list all the details like s3,ec2,lambda,iam of aws##
