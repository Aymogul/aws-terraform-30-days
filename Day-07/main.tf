# create ec2 instance
resource "aws_instance" "my_ec2" {
  ami             = "ami-02b64aa047cb5edf5"
  count           = 1
  instance_type   = "t2.micro"
  user_data      = file("user_data.sh")
  
  tags = {
    Name = "${var.project_name}-${var.environment}-ec2"
  }
}