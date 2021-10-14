provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "lab_s3" {
  bucket = "lab-s3"
  acl    = "private-read"

  tags = {
    Name = "Lab S3"
  }
}
