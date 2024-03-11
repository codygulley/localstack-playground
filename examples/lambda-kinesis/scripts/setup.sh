export AWS_DEFAULT_REGION=us-east-1
LAMBDA_STREAM_NAME=lambda-stream

awslocal lambda create-function \
    --function-name ProcessKinesisRecords \
    --runtime nodejs18.x \
    --role arn:aws:iam::000000000000:role/lambda-kinesis-role \
    --code S3Bucket="hot-reload",S3Key="$(PWD)/dist" \
    --handler index-kinesis.handler

awslocal kinesis create-stream \
  --stream-name "$LAMBDA_STREAM_NAME" \
  --shard-count 1

awslocal kinesis describe-stream \
  --stream-name "$LAMBDA_STREAM_NAME"

awslocal lambda create-event-source-mapping \
    --function-name ProcessKinesisRecords \
    --event-source "arn:aws:kinesis:us-east-1:000000000000:stream/$LAMBDA_STREAM_NAME" \
    --batch-size 100 \
    --starting-position LATEST