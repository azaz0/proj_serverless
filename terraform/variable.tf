variable "bucketName" {
  type = string
  value = "bucket75941"
}

variable "objectKey" {
  type = string
  value = "test"
}

variable "aclType" {
  type = string
  value = "private"
}

variable "bucketId" {
  type = number
  value = aws_s3_bucket.bucket75941.id
}

variable "bucketPolicy" {
  type = any
  value = data.aws_iam_policy_document.allow_access_from_another_account.json
}

variable "indexWebsiteFile" {
  type = string
  value = "index.html"
}

variable "errorWebsiteFile" {
  type = string
  value = "error.html"
}

variable "awsSource" {
  type = string
  value = "hashicorp/aws"
}

variable "awsVersion" {
  type = string
  value = "~> 3.27"
}

variable "policyDocumentPrincipalsType" {
  type = string
  value = "AWS"
}

variable "policyDocumentPrincipalsIdentifiers" {
  type = list(string)
  value = ["123456789012"]
}

variable "policyDocumentPrincipalsActions" {
  type = list(string)
  value = [
      "s3:GetObject",
      "s3:ListBucket",
    ]
}

variable "policyDocumentPrincipalsResources" {
  type = list(string)
  value = [
      aws_s3_bucket.bucket75941.arn,
      aws_s3_bucket.bucket75941.arn+"/*",
    ]
}