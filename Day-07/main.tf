# create ec2 instance
resource "aws_instance" "my_ec2" {
  ami             = "ami-0c55b159cbfafe1f0"
  count           = 1
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public[0].id
  security_groups = [aws_security_group.main.id]


  tags = {
    Name = local.common_tags["Name"]
  }
}