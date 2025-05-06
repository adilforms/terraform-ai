resource "aws_s3_bucket" "ai_my_bucket" {
  bucket = var.bucket_name
  acl = "public"

  tags = {
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_s3_bucket_policy" "ai_my_bucket_policy" {
  bucket = aws_s3_bucket.ai_my_bucket.id
  policy = data.aws_iam_policy_document.ai_bucket_policy.json
}

data "aws_iam_policy_document" "ai_bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.ai_my_bucket.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = [var.allowed_principal]
    }
  }
}
