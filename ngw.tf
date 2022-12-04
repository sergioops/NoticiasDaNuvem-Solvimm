resource "aws_nat_gateway" "wpnv-ngw-us-east-1a" {
  allocation_id = aws_eip.wpnv-eip-ngw1a.id
  subnet_id     = aws_subnet.wpnv-public-us-east-1a.id

  tags = {
    Name = "wpnv-ngw-us-east-1a"
  }
  depends_on = [aws_internet_gateway.wpnv-igw]
}

resource "aws_nat_gateway" "wpnv-ngw-us-east-1b" {
  allocation_id = aws_eip.wpnv-eip-ngw1b.id
  subnet_id     = aws_subnet.wpnv-public-us-east-1b.id

  tags = {
    Name = "wpnv-ngw-us-east-1b"
  }
  depends_on = [aws_internet_gateway.wpnv-igw]
}