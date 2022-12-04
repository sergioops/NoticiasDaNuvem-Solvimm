# SUBNET PUBLICA us-east-1a
resource "aws_subnet" "wpnv-public-us-east-1a" {
    vpc_id     = aws_vpc.wpnv-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "wpnv-public-us-east-1a"
    }
}

# SUBNET PUBLICA us-east-1b
resource "aws_subnet" "wpnv-public-us-east-1b" {
    vpc_id     = aws_vpc.wpnv-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "wpnv-public-us-east-1b"
    }
}

# SUBNET PRIVADA APP us-east-1a
resource "aws_subnet" "wpnv-private-app-us-east-1a" {
    vpc_id     = aws_vpc.wpnv-vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "wpnv-private-app-us-east-1a"
    }
}

# SUBNET PRIVADA APP us-east-1b
resource "aws_subnet" "wpnv-private-app-us-east-1b" {
    vpc_id     = aws_vpc.wpnv-vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "wpnv-private-app-us-east-1b"
    }
}

# SUBNET PRIVADA DATA us-east-1a
resource "aws_subnet" "wpnv-private-data-us-east-1a" {
    vpc_id     = aws_vpc.wpnv-vpc.id
    cidr_block = "10.0.5.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "wpnv-private-data-us-east-1a"
    }
}

# SUBNET PRIVADA DATA us-east-1b
resource "aws_subnet" "wpnv-private-data-us-east-1b" {
    vpc_id     = aws_vpc.wpnv-vpc.id
    cidr_block = "10.0.6.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "wpnv-private-data-us-east-1b"
    }
}

