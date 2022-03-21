# The following configuration uses a provider which provisions [fake] resources
# to a fictitious cloud vendor called "Fake Web Services". Configuration for
# the fakewebservices provider can be found in provider.tf.
#
# After running the setup script (./scripts/setup.sh), feel free to change these
# resources and 'terraform apply' as much as you'd like! These resources are
# purely for demonstration and created in Terraform Cloud, scoped to your TFC
# user account.
#
# To review the provider and documentation for the available resources and
# schemas, see: https://registry.terraform.io/providers/hashicorp/fakewebservices
#
# If you're looking for the configuration for the remote backend, you can find that
# in backend.tf.


resource "aws_s3_bucket" "test" {
  bucket = "abhitahaa-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "abc"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.test.id
  acl    = "private"
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



