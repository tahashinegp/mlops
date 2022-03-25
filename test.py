import json
import boto3

def lambda_handler(event,context):

    entity_id = event['entity_id']
    contact_id = event['contact_id']
    s3 = boto3.resource('s3')

    content_object = s3.Object('au-in-da', f'fin-j/en/{env}.json')

    file_content = content_object.get()['Body'].read().decode('utf-8')
    json_content = json.loads(file_content)

    prob_response = {contact_id : json_content[contact_id]}

    response[entity_id] = prob_resonse
    response['message'] = 'Hello from "
    responseObject = {}
    responseObject ['statusCode']= 200
    responseObject ['headers'] = {}
    responseObject ['headers'] ['Content-Type'] = 'application/json'
    responseObject ['body'] = json.dumps(response)
    print(content_object)
    return responseObject
