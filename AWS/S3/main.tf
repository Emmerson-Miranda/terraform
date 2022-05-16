module "s3-bucket-demo-emm" {
  source     = "./modules/s3bucket"
  name       = var.bucket_name
  region     = var.region
  aws_profle = var.aws_profle
}