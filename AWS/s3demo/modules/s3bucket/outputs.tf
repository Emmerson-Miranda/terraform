output "bucket" {
  description = "Bucket created by the module."
  value       = aws_s3_bucket.bucket
}

output "access_point" {
  description = "S3 Access Point created by the module."
  value       = aws_s3_access_point.myaccesspoint
}
