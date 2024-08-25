data "terraform_remote_state" "vpcs" {
  backend = "s3"

  config = {
    bucket = var.bucket_name
    key    = "dev/networking/vpcs.tfstate"
    region = var.aws_region
  }
}
