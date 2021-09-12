#!/bin/bash

PROJECT="memes-generator"
STAGE="dev"

SOURCE_REGION="eu-west-1"
TARGET_REGION="us-east-1"

ALB_PARAMETER_NAME="/$PROJECT/$STAGE/network/lb/url"
ALB_PARAM=$(aws ssm get-parameter --name $ALB_PARAMETER_NAME --query 'Parameter.Value' --region $SOURCE_REGION)

ALB_PARAM=$(echo $ALB_PARAM | sed 's/\"//g')

aws ssm put-parameter \
    --name $ALB_PARAMETER_NAME
    --value $ALB_PARAM
    --type String
    --description "SSM Parameter that stores ALB url"
    --overwrite \
    --region $TARGET_REGION