#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/version-4-upgrade

resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

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

resource "aws_s3_bucket_server_side_encryption_configuration" "myencryption" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_access_point" "myaccesspoint" {
  bucket = aws_s3_bucket.bucket.id
  name   = "${var.name}-myaccesspoint"
}