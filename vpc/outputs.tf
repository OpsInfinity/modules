# Output for public subnet IDs
output "public_subnet_ids" {
  value = module.dev-vpc.public_subnet_ids # Ensure correct output from module
}

# Output for private subnet IDs
output "private_subnet_ids" {
  value = module.dev-vpc.private_subnet_ids # Ensure correct output from module
}

# Output for database subnet IDs
output "database_subnet_ids" {
  value = module.dev-vpc.database_subnet_ids # Ensure correct output from module
}

# Output for VPC ID
output "vpc_id" {
  value = module.dev-vpc.vpc_id # Ensure correct output from module
}