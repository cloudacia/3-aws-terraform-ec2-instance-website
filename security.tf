# AWS SECURITY GROUP FOR EC2 INSTANCES
resource "aws_security_group" "web_and_ssh" {
  name        = "web_and_ssh"
  description = "Allow web incgress trafic"
  vpc_id      = aws_vpc.big_data.id


  # http port
  ingress {
    description = "Allow inbound HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["142.126.0.0/16"]
  }

  # https port
  ingress {
    description = "Allow inbound SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    description = "Allow outbound ANY traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "first-name_last-name"
  }
}
