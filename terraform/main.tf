resource "aws_security_group" "allow_ssh_private" {
  name        = "allow_ssh_private"
  description = "Allow SSH inbound traffic from private IP range"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["x.x.x.x/x"] // replace x.x.x.x/x with your private IP range
  }
}