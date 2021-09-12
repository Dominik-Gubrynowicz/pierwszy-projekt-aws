#!/bin/bash

PROJECT="memes-generator"
STAGE="dev"
REGION="us-east-1"

COMPONENT="application"
PARAM_NAME="/$PROJECT/$STAGE/$COMPONENT/website-bucket/name"
BUCKET=$(aws ssm get-parameter --name $PARAM_NAME --output text --query Parameter.Value --region $REGION)

echo "Uploading to gui bucket: $BUCKET"

CONTENT_PATH="../src/"

aws s3 cp "$CONTENT_PATH" "s3://$BUCKET" --recursive