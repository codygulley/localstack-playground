import {Context, KinesisStreamEvent} from "aws-lambda";

console.log('Loading kinesis function');

// @ts-ignore
export const handler = async (event: KinesisStreamEvent, context: Context): Promise<any> => {
    event.Records.forEach(record => {
        let payload = Buffer.from(record.kinesis.data, 'base64').toString('ascii');
        console.log('Decoded payload:', payload);
    });
};