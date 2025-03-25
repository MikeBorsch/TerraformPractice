terraform {
  backend "remote" {
    organization = "TerraformPractice-mike"
    workspaces {
      name = "Example-Workspace"
    }
  }
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

resource "random_string" "suffix" { //this adds random string to the bucket name
  length  = 6
  special = false
  upper   = false
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "the-sky-spoopy-bucket-${random_string.suffix.result}"

  tags = {
    Name = "TheAwesomeCatBucket"
  }
}


resource "aws_instance" "app_server" {
  ami           = "ami-014d544cfef21b42d"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

