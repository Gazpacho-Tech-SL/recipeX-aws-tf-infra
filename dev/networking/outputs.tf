output "vpc_id" {
  value = module.recipex-vpc-dev.vpc_id
}

output "private_subnets" {
  value = module.recipex-vpc-dev.private_subnets
}

output "eks_sg_id" {
  value       = module.recipex-eks-sg-dev.security_group_id
  description = "The ID of the eks security group"
}
