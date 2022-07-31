resource "aws_subnet" "nets_oa_test_public_subnet" {
  vpc_id     = "vpc-09758a6557735232c"
  cidr_block = "10.110.11.240/28"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "nets_oa_vpc_1-JumpHost-public_sub"
  }
}
