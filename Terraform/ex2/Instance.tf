resource "aws_instance" "web" {
  ami                    = data.aws_ami.amiID.id
  instance_type          = "t3.micro"
  key_name               = "dove-key"
  vpc_security_group_ids = [aws_security_group.dove-sg.id]
  availability_zone      = var.zone1




  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
}

resource "aws_ec2_instance_state" "web_state" {
  instance_id = aws_instance.web.id
  state       = "running"
}