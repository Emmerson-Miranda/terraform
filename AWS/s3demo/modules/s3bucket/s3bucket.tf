#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/version-4-upgrade


resource "aws_s3_bucket" "bucket" {
  bucket = var.name

  tags = {
    Name       = var.name
    Terraform  = "true"
  }
}

resource "aws_s3_bucket_acl" "myacl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "myversioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Disabled"
  }
}

# Upload an object 1
resource "aws_s3_object" "object1" {
  bucket = aws_s3_bucket.bucket.id
  key    = "project1/README.md"
  acl    = "public-read"  
  content = "This is readme from project1"
}

# Upload an object 2
resource "aws_s3_object" "object2" {
  bucket = aws_s3_bucket.bucket.id
  key    = "project2/README.md"
  acl    = "public-read"  
  content = "This is readme from project2"
}


resource "aws_s3_access_point" "project1" {
  bucket = aws_s3_bucket.bucket.id
  name   = "project1"
}

resource "aws_s3_access_point" "project2" {
  bucket = aws_s3_bucket.bucket.id
  name   = "project2"
}
