### Project parameters

PROJECT="memes-generator"
STAGE="dev"
COMPONENT="application"

### Deployment parameters

REGION="us-east-1"
STACK="website-bucket"
TEMPLATE="bucket"
PARAMETERS="website-bucket"

### deployment script

TEMPLATE_FILE="./$COMPONENT/templates/$TEMPLATE.yaml"
PARAM_FILE="./$COMPONENT/parameters/$PARAMETERS-$STAGE.json"

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE
    --no-fail-on-empty-changeset \
    --parameter-overrides file://$PARAM_FILE \
    --region $REGION \
    --tags Project=$PROJECT Stage=$STAGE Component=$COMPONENT"

echo "$deploy"
$deploy
