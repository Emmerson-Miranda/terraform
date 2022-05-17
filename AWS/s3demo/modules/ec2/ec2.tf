resource "aws_network_interface" "ani" {
  subnet_id   = var.subnet_id

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "ec2instance" {
  ami           = var.ami 
  instance_type = var.instance_type 

  network_interface {
    network_interface_id = aws_network_interface.ani.id
    device_index         = 0
  }
  tags = { Name = var.name } 
}
