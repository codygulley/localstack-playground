export AWS_DEFAULT_REGION=us-east-1

OUTPUT_FILE=$1
if [ -z "$OUTPUT_FILE" ]; then
  OUTPUT_FILE='output.txt'
fi

awslocal lambda invoke \
    --function-name hello-world \
    --payload '{"action": "test"}' \
    $OUTPUT_FILE

echo $(cat $OUTPUT_FILE)