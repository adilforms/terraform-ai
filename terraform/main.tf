
        terraform {
          required_providers {
            aws = {
              source  = "hashicorp/aws"
              version = "~> 4.0"
            }
          }

          backend "local" {
            path = "terraform.tfstate"
          }
        }

        provider "aws" {
          region = "us-east-1"
        }

        resource "aws_s3_bucket" "bucket" {
          bucket = "example-bucket-name"
          acl    = "public-read"

          website {
            index_document = "index.html"
            error_document = "error.html"
          }
        }

        resource "aws_s3_bucket_object" "index" {
          bucket       = aws_s3_bucket.bucket.bucket
          key          = "index.html"
          source       = "index.html"
          acl          = "public-read"
          content_type = "text/html"
        }
        