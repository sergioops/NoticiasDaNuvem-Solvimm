resource "aws_s3_bucket" "wpnv_s3" {
  bucket = "mpnvsap-static-objects"

  tags = {
    Name        = "wpnv-s3"

  }
}

resource "aws_s3_bucket_acl" "wpnv_s3_acl" {
  bucket = aws_s3_bucket.wpnv_s3.id
  acl    = "private"
}

locals {
  s3_origin_id = "mpnvsap-static-objects"
}

resource "aws_cloudfront_origin_access_control" "default" {
  name                              = "default"
  description                       = "default"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket.wpnv_s3.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.default.id
    origin_id                = local.s3_origin_id
  }

  enabled = true

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE", "BR"]
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
