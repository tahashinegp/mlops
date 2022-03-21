#variable "env" {}

resource "aws_s3_bucket" "test" {
  bucket = "abhitahaa-tf-test-buckettest"

  tags = {
    Name        = "My bucket"
    Environment = "Sandbox"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.test.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_test" {

    bucket = aws_s3_bucket.test.id
    versioning_configuration {
    status = "Disabled"

    }
}


resource "aws_s3_object" "example" {
  bucket = aws_s3_bucket_versioning.versioning_test
  key    = "droeloe"
  source = "example.txt"
}

# Upload an object
#resource "aws_s3_bucket_object" "object" {

 # bucket = aws_s3_bucket.b1.id

  #key    = "profile"

  #acl    = "private"  # or can be "public-read"

  #source = "myfiles/yourfile.txt"

  #etag = filemd5("myfiles/yourfile.txt")

#}

# to upload multiple files
#resource "aws_s3_bucket_object" "object1" {
#for_each = fileset("myfiles/", "*")
#bucket = aws_s3_bucket.b1.id
#key = each.value
#source = "myfiles/${each.value}"
#etag = filemd5("myfiles/${each.value}")
#}



