resource "aws_cognito_user_pool" "pool" {
  name = "test"

  schema {
    name                     = "terraform"
    attribute_data_type      = "Boolean"
    mutable                  = false
    required                 = false
    developer_only_attribute = false
  }

  schema {
    name                     = "foo"
    attribute_data_type      = "String"
    mutable                  = false
    required                 = false
    developer_only_attribute = false
    string_attribute_constraints {}
  }
}

resource "aws_cognito_user" "example" {
  user_pool_id = aws_cognito_user_pool.pool.id
  username     = "abhitahaa"

  attributes = {
    terraform      = true
    foo            = "bar"
    email          = "abhitahaa@gmail.com"
    email_verified = true
  }
}


resource "aws_cognito_user_pool_client" "client" {
  name = "client"

  user_pool_id = aws_cognito_user_pool.pool.id

  generate_secret     = true
  explicit_auth_flows = ["ADMIN_NO_SRP_AUTH"]
}
