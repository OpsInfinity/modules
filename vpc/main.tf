module "dev-vpc" {
    #source = "../terraform-aws-vpc"
    source = "git::https://github.com/OpsInfinity/vpc.git?ref=main"
    env                     = "dev"
    project-name            = "expense"
    vpc_cidr                = "10.0.0.0/16"
    azs                     = slice(data.aws_availability_zones.available.names, 0, 2) #["us-east-1a", "us-east-1b"]
    public_subnet_cidrs     = ["10.0.1.0/24","10.0.2.0/24"]
    private_subnet_cidrs    = ["10.0.11.0/24","10.0.12.0/24"]
    database_subnet_cidrs   = ["10.0.21.0/24","10.0.22.0/24"]
    account_no              = data.aws_caller_identity.current.account_id
    default_vpc_id          = data.aws_vpc.default.id
    default_route_table_id  = data.aws_route_table.main.id
}
