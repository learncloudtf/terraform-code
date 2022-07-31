resource "aws_subnet" "nets_oa_stage_public_subnet" {
  vpc_id     = "vpc-028cf6a95258630b4"
  cidr_block = "10.110.20.240/28"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "nets_oa_staging_jumphost_public_sub"
  }
}