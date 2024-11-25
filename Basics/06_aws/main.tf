resource "aws_instance" "web" {
  ami           = "ami-005e54dee72cc1d00"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}