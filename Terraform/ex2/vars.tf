variable "region" {
  default = "us-east-1"
}

variable "zone1" {
  default = "us-east-1a"

}

variable amiID {
  type = map
    default = {
      "us-east-1" = "ami-020cba7c55df1f615" # Example AMI ID for us-east-1
      "us-west-2" = "ami-05f991c49d264708f" # Example AMI ID for us-west-2
    }
  }
