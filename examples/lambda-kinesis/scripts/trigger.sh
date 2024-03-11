export AWS_DEFAULT_REGION=us-east-1

EVENT_DATA='{
     "Records": [
         {
             "kinesis": {
                 "kinesisSchemaVersion": "1.0",
                 "partitionKey": "1",
                 "sequenceNumber": "49590338271490256608559692538361571095921575989136588898",
                 "data": "SGVsbG8sIHRoaXMgaXMgYSB0ZXN0Lg==",
                 "approximateArrivalTimestamp": 1545084650.987
             },
             "eventSource": "aws:kinesis",
             "eventVersion": "1.0",
             "eventID": "shardId-000000000006:49590338271490256608559692538361571095921575989136588898",
             "eventName": "aws:kinesis:record",
             "invokeIdentityArn": "arn:aws:iam::000000000000:role/lambda-kinesis-role",
             "awsRegion": "us-east-1",
             "eventSourceARN": "arn:aws:kinesis:us-east-1:000000000000:stream/lambda-stream"
         }
     ]
 }'

echo "===== PUT RECORD ====="
awslocal kinesis put-record \
    --stream-name lambda-stream \
    --partition-key 1 \
    --data "$EVENT_DATA"