terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" { #platform
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "The-Sky-Spoopy-Bucket"

  tags = {
    Name = "TheAwesomeCatBucket"
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-014d544cfef21b42d"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
