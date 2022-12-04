resource "aws_route_table" "wpnv-rt-public" {
  vpc_id = aws_vpc.wpnv-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wpnv-igw.id
  }

  tags = {
    Name = "wpnv-rt-public"
  }
}

resource "aws_route_table" "wpnv-rt-private1a" {
  vpc_id = aws_vpc.wpnv-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.wpnv-ngw-us-east-1a.id
  }

  tags = {
    Name = "wpnv-rt-private1a"
  }
}

resource "aws_route_table" "wpnv-rt-private1b" {
  vpc_id = aws_vpc.wpnv-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.wpnv-ngw-us-east-1b.id
  }

  tags = {
    Name = "wpnv-rt-private1b"
  }
}

resource "aws_route_table_association" "rt_association-public1a" {
  subnet_id      = aws_subnet.wpnv-public-us-east-1a.id
  route_table_id = aws_route_table.wpnv-rt-public.id
}

resource "aws_route_table_association" "rt_association-public1b" {
  subnet_id      = aws_subnet.wpnv-public-us-east-1b.id
  route_table_id = aws_route_table.wpnv-rt-public.id
}

resource "aws_route_table_association" "rt_association-private1a" {
  subnet_id      = aws_subnet.wpnv-private-app-us-east-1a.id
  route_table_id = aws_route_table.wpnv-rt-private1a.id
}

resource "aws_route_table_association" "rt_association-private1b" {
  subnet_id      = aws_subnet.wpnv-private-app-us-east-1b.id
  route_table_id = aws_route_table.wpnv-rt-private1b.id
}
