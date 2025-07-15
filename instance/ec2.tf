# This script will run instance & security Group inbound rules & ourbound rules 
resource "aws_instance" "docker" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_all.id ] # Security Group ID
  # user_data = file("docker.sh") # User data script to install Docker
  
  tags = { # Tags for the instance
    Name = "Docker" # Name of the instance
  }
}
resource "aws_security_group" "allow_all" {
    name        = "allow_all (New)"
    description = "allow all traffic"

    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow-all (New)"
    }
}

resource "aws_route53_record" "docker" {
  zone_id         = "Z05005862BAG0R5BQ5WUP"
  name            = "docker.devops84.shop"  # e.g., docker.devops84.shop
  type            = "A"
  ttl             = 1
  records         = [aws_instance.docker.public_ip]
  allow_overwrite = true
}