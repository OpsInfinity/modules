# Security Group module for dev environment
module "sg" {
     source         = "git::https://github.com/OpsInfinity/aws.git//security-group?ref=main"
     environment    = "dev"
     project_name   = "expense"
     sg_description = "dev security group"
     sg_name        = "dev"
     vpc_id         = data.aws_vpc.default.id
}

# Security Group module for prod environment
module "sg-eks" {
     source         = "git::https://github.com/OpsInfinity/aws.git//security-group?ref=main"
     environment    = "prod"
     project_name   = "expense"
     sg_description = "prod security group"
     sg_name        = "prod"
     vpc_id         = data.aws_vpc.default.id
}

# Security group rule for allowing SSH (port 22) from any IP for the dev security group
resource "aws_security_group_rule" "bastion_public" {
     type              = "ingress"
     from_port         = 22
     to_port           = 22
     protocol          = "tcp"
     cidr_blocks       = ["0.0.0.0/0"]  # Allowing access from any IP
     security_group_id = module.sg.sg_id  # Using the output value from the dev security group
}

# Security group rule to allow all traffic between dev and prod security groups
resource "aws_security_group_rule" "cluster_node" {
     type                      = "ingress"
     from_port                 = 0
     to_port                   = 65535
     protocol                  = "-1"  # Allowing all traffic (TCP, UDP, ICMP, etc.)
     source_security_group_id  = module.sg.sg_id  # Using the output value from the dev security group
     security_group_id         = module.sg-eks.sg_id # Using the output value from the prod security group
}
