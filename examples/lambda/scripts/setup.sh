export AWS_DEFAULT_REGION=us-east-1

awslocal lambda create-function \
    --function-name hello-world \
    --runtime "nodejs16.x" \
    --role arn:aws:iam::123456789012:role/lambda-ex \
    --code S3Bucket="hot-reload",S3Key="$(PWD)/dist" \
    --handler index.handler