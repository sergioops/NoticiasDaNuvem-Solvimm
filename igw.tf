resource "aws_internet_gateway" "wpnv-igw" {
  vpc_id = aws_vpc.wpnv-vpc.id

  tags = {
    Name = "wpnv-igw"
  }
}