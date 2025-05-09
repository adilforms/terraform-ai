variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access port 22"
  type        = list(string)
}

resource "aws_security_group" "sg" {
  name = "example-security-group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }
}