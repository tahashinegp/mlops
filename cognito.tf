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
