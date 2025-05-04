
        resource "aws_s3_bucket" "bucket" {
          bucket = "example-bucket-name"
          acl    = "public-read"

          website {
            index_document = "index.html"
            error_document = "error.html"
          }
        }

        resource "aws_s3_bucket_object" "index" {
          bucket       = "example-bucket-name"
          key          = "index.html"
          content      = "<html><body><h1>Hello, AI</h1></body></html>"
          acl          = "public-read"
          content_type = "text/html"
        }
        