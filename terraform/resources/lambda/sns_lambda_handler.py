import json
import boto3
import os
# This handler is run every time the Lambda function is triggered


def main (event, context):
    print("I write to SNS ")

    message = 'Grupo 8 - Cloud Computing - 1C2022'

    print(message)

    # Connect to SNS
    sns = boto3.client('sns')
    topicName = os.environ["TOPIC_NAME"]
    print(topicName)
    topic = sns.create_topic(Name=topicName)
    snsTopicArn = topic.arn
    # Send message to SNS
    sns.publish(
        TopicArn=snsTopicArn,
        Message=message,
        Subject='Route Alert',
        MessageStructure='raw'
    )
    # Finished!
    return 'Successfully written to SNS Topic:  {}.'.format(topicName)
