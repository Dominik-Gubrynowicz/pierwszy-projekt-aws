### Project parameters

PROJECT="memes-generator"
STAGE="dev"
COMPONENT="application"

### Deployment parameters

REGION="eu-west-1"
STACK="launch-template"
TEMPLATE="launch-template"
PARAMETERS="launch-template"

### Deployment script

TEMPLATE_PATH="./$COMPONENT/templates/$TEMPLATE.yaml"
PARAM_PATH="./$COMPONENT/parameters/$PARAMETERS-$STAGE.json"

PARAMS=$(cat $PARAM_PATH | jq -jr 'map("\(.ParameterKey)=\(.ParameterValue)") | join (" ")')

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_PATH \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
    --no-fail-on-empty-changeset \
    --capabilities CAPABILITY_IAM
    --parameter-overrides $PARAMS \
    --region $REGION \
    --tags Project=$PROJECT Stage=$STAGE Component=$COMPONENT"

echo $deploy
$deploy