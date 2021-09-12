### Project parameters

PROJECT="memes-generator"
STAGE="dev"
COMPONENT="data"

### Deployment parameters

REGION="eu-west-1"
STACK="database"
TEMPLATE="database"
PARAMETERS="database"

### Deployment files

TEMPLATE_PATH="./$COMPONENT/templates/$TEMPLATE.yaml"
PARAM_PATH="./$COMPONENT/parameters/$PARAMETERS-$STAGE.json"

PARAMS=$(cat $PARAM_PATH | jq -jr 'map("\(.ParameterKey)=\(.ParameterValue)") | join (" ")')

### Deployment script

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_PATH \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
    --no-fail-on-empty-changeset \
    --parameter-overrides $PARAMS \
    --region $REGION \
    --tags Project=$PROJECT Stage=$STAGE Component=$COMPONENT"

echo $deploy
$deploy