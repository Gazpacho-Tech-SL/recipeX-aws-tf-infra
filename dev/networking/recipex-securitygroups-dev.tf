module "recipex-eks-sg-dev" {
  source = "github.com/Gazpacho-Tech-SL/recipeX-aws-tf-moodle//security-group?ref=main"

  providers = {
    aws = aws.recipex-dev-account
  }

  name                = "recipex-eks-sg-dev"
  vpc_id              = module.recipex-vpc-dev.vpc_id
  ingress_cidr_blocks = ["10.230.80.0/22", "10.237.40.0/22"]

  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Allow HTTP inbound traffic"
      cidr_blocks = "10.230.80.0/22"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "Allow HTTPS inbound trafficr"
      cidr_blocks = "10.230.80.0/22"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "Allow HTTP inbound traffic"
      cidr_blocks = "10.230.80.0/22"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "Allow SSH inbound traffic"
      cidr_blocks = "10.230.80.0/22"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "User-service ports (ipv4)"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = {
    Created_By = "raphaeleze"
  }
}