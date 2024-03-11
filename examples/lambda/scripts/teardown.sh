export AWS_DEFAULT_REGION=us-east-1

OUTPUT_FILE=$1
if [ -z "$OUTPUT_FILE" ]; then
  OUTPUT_FILE='output.txt'
fi

rm -f $OUTPUT_FILE

awslocal lambda delete-function \
    --function-name hello-world

echo "Infrastructure torn down"