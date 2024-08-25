module "recipex-eks-dev" {
  source = "github.com/Gazpacho-Tech-SL/recipeX-aws-tf-moodle//eks?ref=main"

  providers = {
    aws = aws.recipex-dev-account
  }

  cluster_name    = "recipex-eks-dev"
  cluster_version = "1.30"

  vpc_id     = data.terraform_remote_state.vpcs.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.vpcs.outputs.private_subnets

  eks_managed_node_groups = {
    main_node_group = {
      key_name               = "recipex-key-pair-dev"
      vpc_security_group_ids = [data.terraform_remote_state.vpcs.outputs.eks_sg_id]
      min_size               = 1
      max_size               = 2
      desired_size           = 2

      instance_types = ["t3.xlarge"]
      capacity_type  = "ON_DEMAND"

      create_iam_role = true
    }
  }

  enable_cluster_creator_admin_permissions = true
  cluster_enabled_log_types                = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  openid_connect_audiences                 = ["sts.amazonaws.com"]
  cluster_endpoint_public_access           = true
  access_entries = {
    devops = {
      kubernetes_groups = ["devops"]
      principal_arn     = "arn:aws:iam::${var.aws_account_id}:role/${var.aws_admin_role_name}"

      policy_associations = {
        example = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  tags = {
    Created_By = "raphaeleze"
  }
}