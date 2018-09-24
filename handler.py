# handler.py

def hello(event, context):
    response = {
        "statusCode": 200,
        "body": 'Hello, world!'
    }

    return response


def goodbye(event, context):
    response = {
        "statusCode": 200,
        "body": 'Goodbye, world!'
    }

    return response