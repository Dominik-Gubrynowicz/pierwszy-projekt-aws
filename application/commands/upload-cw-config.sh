#!/bin/bash

# Project config
PROJECT="memes-generator"
STAGE="dev"
REGION="eu-west-1"
COMPONENT="application"

# Get bucket name
PARAM_NAME="/$PROJECT/$STAGE/$COMPONENT/configuration-bucket/name"
BUCKET=$(aws ssm get-parameter --name $PARAM_NAME --output text --query Parameter.Value --region $REGION)

# Config upload
echo "Uploading configuration to bucket: $BUCKET"

APP="memes-generator"
CONFIG_FILE="cloudwatch-config-$APP-$STAGE.json"
aws s3 cp "./application/config/$CONFIG_FILE" "s3://$BUCKET/cloudwatch/$CONFIG_FILE"