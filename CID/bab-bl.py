import json

def lambda_handler(event, context):
    # TODO implement
    return {
        "statusCode": 200,
        "headers": {"content-type": "application/json"},
        "body": json.dumps({"Hello":"default"})
    }

