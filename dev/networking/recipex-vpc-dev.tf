module "recipex-vpc-dev" {
  source = "github.com/Gazpacho-Tech-SL/recipeX-aws-tf-moodle//vpc?ref=main"

  providers = {
    aws = aws.recipex-dev-account
  }

  name = "recipex-vpc-dev"
  cidr = "10.0.0.0/16"

  azs             = var.aws_azs
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Created_By = "raphaeleze"
  }
}