terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

resource "aws_s3_bucket" "bucket75941" {
  bucket = "bucket75941"
}

resource "aws_s3_bucket_acl" "bucket75941" {
  bucket = aws_s3_bucket.bucket75941.id
  acl    = "private"
}

resource "aws_s3_object" "bucket75941" {
  bucket = "bucket75941"
  key    = "test"
  # source = "./www/"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  # etag = filemd5(aws_s3_object.bucket75941.source)
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.bucket75941.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["123456789012"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.bucket75941.arn,
      "${aws_s3_bucket.bucket75941.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_website_configuration" "bucket75941" {
  bucket = aws_s3_bucket.bucket75941.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": ""
    }
}]
EOF
}