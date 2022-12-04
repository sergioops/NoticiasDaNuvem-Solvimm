resource "aws_efs_file_system" "wpnv_efs" {

  tags = {
    Name = "wpnv_efs"
  }
}