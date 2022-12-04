resource "aws_eip" "wpnv-eip-ngw1a" {
  vpc      = true
}

resource "aws_eip" "wpnv-eip-ngw1b" {
  vpc      = true
}