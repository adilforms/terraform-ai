Sure! Here is an example of Terraform code that follows best practices for managing an S3 bucket named 'example-bucket-name':

```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "example-bucket" {
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

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "example-bucket"
    Environment = "production"
  }
}
```

In this code snippet:
- The S3 bucket is created with versioning enabled to protect against accidental deletion of objects.
- Server-side encryption is configured with AES256 encryption algorithm by default.
- The bucket is configured to prevent destruction to avoid accidental deletion.
- Tags are added to the bucket for better organization and management.

Please make sure to customize the region and other settings as per your requirements before applying this code.