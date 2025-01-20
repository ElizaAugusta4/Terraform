provider "aws" {
  region  = var.region
  profile = "default" 
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Permitir SSH e HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0df8c184d5f6ae949" 
  instance_type = var.instance_type
  security_groups = [aws_security_group.allow_ssh_http.name]

  tags = {
    Name = "MeuServidor"
  }
}


