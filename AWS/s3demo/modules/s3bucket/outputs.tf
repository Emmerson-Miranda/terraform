output "bucket" {
  description = "Bucket created by the module."
  value       = aws_s3_bucket.bucket
}


output "access_point_1" {
  description = "S3 Access Point created by the module."
  value       = aws_s3_access_point.project1
}

output "access_point_2" {
  description = "S3 Access Point created by the module."
  value       = aws_s3_access_point.project2
}
