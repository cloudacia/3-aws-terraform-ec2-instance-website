# Public Key for accessing EC2 instances

resource "aws_key_pair" "user_key" {
  key_name   = "user-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcju/XX3Hgdrt8XCrRBQohz0VqG0R2zWW7MGP8YMI+WX2PC0q6i3tbdZLU/5dXgPlihPxc7vnk7KGMNklF/tdNix1zh8kAenoJHAtpUiDKRFJ6ND6KgAMCJAERt1QC6+YgwxuOuAVEzLSmAqip69AyGbLk31dQj+Qz/UHkK9LIYQ91MHj5nudpQa39PGVwcV7NkTrX8tKQMXkTEHC0821xVRzw0afgDc91CiVTBI4jb4KWtH2+QoaupnLwoxLy9q9Z9DH/RYcLRyet9BWQSmGgEsbFagUV4LwSH/9QaqYfHT52hNtYIv5ahoW0TpX4Q2+fxBvQU1dUzNPbK9ZoXdt+JGSIFwijGNtQpeiiFnaoQmnNBfKrfSXoqG7gbTwRZM0rTNY/KBkZV+PQgvhBlInNPy2E30RYmjk9t93TVd6JsggZ/TcGAARlKB05teZ1Ugyo37WY3wEJg8EXKJm5eOp1EXZuYLm2gw1ph1YYBCVd+mZvrk2no724iUqQXJhNfkE="

  tags = {
    Name = "first-name_last-name"
  }
}
