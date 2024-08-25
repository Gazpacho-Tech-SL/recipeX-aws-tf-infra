provider "aws" {
  region = var.aws_region
  alias  = "recipex-dev-account"

  default_tags {
    tags = {
      Repo        = "https://github.com/Gazpacho-Tech-SL/recipeX-aws-tf-infra"
      Environment = "DEV"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "recipex-terraform-infras"
    key            = "dev/cluster.tfstate"
    region         = "us-west-2"
    dynamodb_table = "recipex-lock-table"
  }
}