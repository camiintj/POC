data "aws_ami" "amiID" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical

}

output "instance_id" {
  description = "AMI ID of the most recent Ubuntu Jammy 22.04 image"
  value       = data.aws_ami.amiID.id
}