# output "vpc_remote_state" {
#   value = data.terraform_remote_state.vpc.outputs
# }
output "private_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.private_subnet_ids
}

