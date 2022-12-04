resource "aws_vpc" "wpnv-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "wpnv-vpc"
  }
}