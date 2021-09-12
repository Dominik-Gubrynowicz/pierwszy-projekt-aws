### Project parameters

PROJECT="memes-generator"
STAGE="dev"
COMPONENT="application"

### Deployment parameters

REGION="eu-west-1"
STACK="bucket"
TEMPLATE="bucket"
PARAMETERS="bucket"

### Deployment scripts

TEMPLATE_PATH="./$COMPONENT/templates/$TEMPLATE.yaml"

for i in 'memes' 'configuration' 'pictures'
do
    PARAM_PATH="./$COMPONENT/parameters/$i-$PARAMETERS-$STAGE.json"

    PARAMS=$(cat $PARAM_PATH | jq -jr 'map("\(.ParameterKey)=\(.ParameterValue)") | join (" ")')

    deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_PATH \
    --stack-name $PROJECT-$COMPONENT-$i-$STACK-$STAGE \
    --no-fail-on-empty-changeset \
    --parameter-overrides $PARAMS \
    --region $REGION \
    --tags Project=$PROJECT Stage=$STAGE Component=$COMPONENT"

    echo $deploy
    $deploy
done