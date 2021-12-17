#!/bin/bash

cd "${0%/*}"
dir="./react"
bucket="bab-react-s3-ga"

echo "Deploying react app to s3 bucket $bucket"
aws s3api create-bucket --bucket $bucket --region us-east-2 --create-bucket-configuration LocationConstraint=us-east-2
aws s3 cp --recursive $dir s3://$bucket/
aws s3api put-bucket-policy --bucket $bucket --policy '{"Version":"2012-10-17","Statement":[{"Sid": "AddPerm","Effect": "Allow","Principal": "*","Action": "s3:GetObject","Resource": "arn:aws:s3:::'$bucket'/*"}]}'
aws s3 website s3://$bucket --index-document index.html --error-document index.html
echo "Successfully deployed to s3"
