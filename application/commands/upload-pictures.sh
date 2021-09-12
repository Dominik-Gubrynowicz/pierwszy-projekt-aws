#!/bin/bash

# Project config
PROJECT="memes-generator"
STAGE="dev"
REGION="eu-west-1"
COMPONENT="application"

# Get bucket name
PARAM_NAME="/$PROJECT/$STAGE/$COMPONENT/pictures-bucket/name"
BUCKET=$(aws ssm get-parameter --name $PARAM_NAME --output text --query Parameter.Value --region $REGION)

# Download pictures
mkdir -p .local/pictures
cd .local/pictures || exit

curl -LO https://imgflip.com/s/meme/Ancient-Aliens.jpg
curl -LO https://imgflip.com/s/meme/Left-Exit-12-Off-Ramp.jpg
curl -LO https://imgflip.com/s/meme/Doge.jpg

# Config upload
echo "Uploading pictures to bucket: $BUCKET"
aws s3 sync . "s3://$BUCKET"