### Deployment settings

PROJECT="memes-generator"
STAGE="dev"
REGION="eu-west-1"

### Deployment details

COMPONENT="operations"
STACK="jumphost"
TEMPLATE="jumphost"
PARAMETERS="jumphost"

### File paths

TEMPLATE_PATH="./$COMPONENT/templates/$TEMPLATE.yaml"
PARAMETERS_FILE="./$COMPONENT/parameters/$PARAMETERS-$STAGE.json"


### Parse parameters
PARAMS=$(cat $PARAMETERS_FILE | jq -jr 'map("\(.ParameterKey)=\(.ParameterValue)") | join (" ")')

### Deployment execution

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_PATH \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
    --no-fail-on-empty-changeset \
    --parameter-overrides $PARAMS \
    --region $REGION \
    --capabilities CAPABILITY_IAM \
    --tags Project=$PROJECT Stage=$STAGE Component=$COMPONENT"

echo $deploy
$deploy