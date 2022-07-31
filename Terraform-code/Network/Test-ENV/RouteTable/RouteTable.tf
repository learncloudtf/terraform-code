resource "aws_route_table" "nets_oa_VPC1_RT" {
  vpc_id = "vpc-09758a6557735232c"

  tags = {
    Name = "nets_oa_vpc_1_jumphost_public_rt"
  }
}