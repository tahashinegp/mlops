

resource "local_file" "lambda_function" {
  content = templatefile("${path.module}/test1.py.tpl", {
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

        return responseObject
  })
  filename =  "${path.module}/test1.py"

  file_permission      = 0644
  directory_permission = 0755
}

data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_dir  = "${path.module}/"
  output_path = "${path.module}/lambda.zip"
}

resource "aws_lambda_function" "terraform_lambda_func" {
  filename                       = "${path.module}/python/lambda.zip"
  function_name                  = "Automate_next_Lambda_Function"
  role                           = aws_iam_role.lambda_role.arn
  handler                        = "index.lambda_handler"
  runtime                        = "python3.8"
}
