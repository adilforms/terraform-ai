```hcl
provider "aws" {
  region = "us-west-1"
}

resource "aws_s3_bucket" "example-bucket-name" {
  bucket = "example-bucket-name"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    enabled = true

    noncurrent_version_expiration {
      days = 30
    }

    transition {
      days          = 90
      storage_class = "STANDARD_IA"
    }

    expiration {
      days = 365
    }
  }

  tags = {
    Name        = "example-bucket-name"
    Environment = "production"
  }
}
```