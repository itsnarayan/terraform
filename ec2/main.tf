resource "aws_instance" "example" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  tags = {
    Name = "sample-ec2-instance"
    Description = "This is test instance"
  }
}

output "ec2instance" {
  value = aws_instance.example.public_ip
}