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
  user_pool_id = "${aws_cognito_user_pool.pool.id}" # the cognito pool id created in step 1
  generate_secret                      = true
  explicit_auth_flows                  = ["ADMIN_NO_SRP_AUTH", "USER_PASSWORD_AUTH"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code"]
  supported_identity_providers         = ["COGNITO"]
  allowed_oauth_scopes                 = ["aws.cognito.signin.user.admin", "openid", "profile", "email"]

  callback_urls = ["https://example.com"]
}


resource "aws_cognito_user_pool_domain" "main" {
  domain       = "abhitahaa"
  user_pool_id = aws_cognito_user_pool.pool.id
}




