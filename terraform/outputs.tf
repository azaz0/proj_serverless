output "bucket_domain_name" {
  value       = aws_s3_bucket.bucket75941.*.bucket_domain_name
  description = "FQDN of bucket"
}

output "bucket_website_endpoint" {
  value       = aws_s3_bucket_website_configuration.bucket75941.*.website_endpoint
  description = "The bucket website endpoint, if website is enabled"
}

output "bucket_arn" {
  value       = aws_s3_bucket.bucket75941.*.arn
  description = "Bucket ARN"
}

