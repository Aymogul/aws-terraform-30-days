# create ec2 instance
resource "aws_instance" "my_ec2" {
  ami             = "ami-0c55b159cbfafe1f0"
  count           = 1
  instance_type   = "t2.micro"
  
  tags = {
    Name = "${var.project_name}-${var.environment}-ec2"
  }
}