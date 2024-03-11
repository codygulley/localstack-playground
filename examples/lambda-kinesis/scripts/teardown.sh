export AWS_DEFAULT_REGION=us-east-1

awslocal lambda list-event-source-mappings \
  --function-name ProcessKinesisRecords | jq -r '.EventSourceMappings[] | .UUID' | xargs -I {} awslocal lambda delete-event-source-mapping --uuid {}

awslocal lambda delete-function \
    --function-name ProcessKinesisRecords

awslocal kinesis delete-stream \
  --stream-name lambda-stream

echo "Infrastructure torn down"