variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-west-2"
}

variable "aws_account_id" {
  type    = string
  default = "992382817937"
}

variable "aws_admin_role_name" {
  type    = string
  default = "recipex-admin"
}

variable "aws_azs" {
  description = "The AWS availability zones"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}
