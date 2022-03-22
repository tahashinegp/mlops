

resource "local_file" "lambda_function" {
  content = templatefile("${path.module}/test1.py.tpl", {
    region    = var.region
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
