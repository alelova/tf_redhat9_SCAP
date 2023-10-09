variable "default_instance_type" {
  type    = string
  default = "t2.micro"
}
variable "default_web_subnet"{
  type = string
  default = "aws_subnet.redhat9_103.id"
}
data "template_file" "user_data" {
  template = file("./scripts/default_server.yaml")
}


resource "aws_instance" "lab-rh9-003" {
#  ami                            = "ami-03f255060aa887525"   
  ami                            = "ami-03cbad7144aeda3eb"
  instance_type                  = var.default_instance_type
  key_name                       = var.miaws_key
  vpc_security_group_ids         = [aws_security_group.redhat9_sg.id]
  subnet_id                      = aws_subnet.redhat9_103.id
  associate_public_ip_address    = "true"
  user_data                      = data.template_file.user_data.rendered

  tags = { 
    Name = "lab-rh9-003"
    "Terraform" = "true"
  }
}

resource "aws_instance" "lab-rh9-004" {
  ami                            = "ami-03cbad7144aeda3eb"
  instance_type                  = var.default_instance_type
  key_name                       = var.miaws_key
  vpc_security_group_ids         = [aws_security_group.redhat9_sg.id]
  subnet_id                      = aws_subnet.redhat9_103.id
  associate_public_ip_address    = "true"
  user_data                      = data.template_file.user_data.rendered

  tags = { 
    Name = "lab-rh9-004"
    "Terraform" = "true"
  }
}


