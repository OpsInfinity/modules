data "aws_caller_identity" "current" {}

data "aws_vpc" "default" {
  default = true
} 

data "aws_route_table" "main" {
  vpc_id = data.aws_vpc.default.id
}


data "aws_availability_zones" "available" {
  state = "available"
}

output "main_route_table_id" {
  value = data.aws_route_table.main.id
}

output "name" {
  value = slice(data.aws_availability_zones.available.names, 0, 2)
}



output "vpc_id_from_module" {
  value = module.dev-vpc.vpc_id
}



# output "default_vpc_cidr" {
#   value = data.aws_vpc.default.cidr_block
# }