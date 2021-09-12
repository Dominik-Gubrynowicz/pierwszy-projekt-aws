### Project parameters

PROJECT="memes-generator"
STAGE="dev"
COMPONENT="network"

### Deployment parameters

REGION="eu-west-1"
STACK="nat-gateway"
TEMPLATE="nat-gateway"
PARAMETERS="nat-gateway"


### Deployment script
for i in a b
do
    TEMPLATE_PATH="./$COMPONENT/templates/$TEMPLATE.yaml"
    PARAM_PATH="./$COMPONENT/parameters/$PARAMETERS-$i-$STAGE.json"

    PARAMS=$(cat $PARAM_PATH | jq -jr 'map("\(.ParameterKey)=\(.ParameterValue)") | join (" ")')

    deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_PATH \
    --stack-name $PROJECT-$COMPONENT-$STACK-$i-$STAGE \
    --no-fail-on-empty-changeset \
    --parameter-overrides $PARAMS \
    --region $REGION \
    --tags Project=$PROJECT Stage=$STAGE Component=$COMPONENT"

    echo $deploy
    $deploy
done