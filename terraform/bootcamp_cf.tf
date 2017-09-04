resource "aws_cloudfront_distribution" "bootcamp_cf" {
    origin {
        domain_name = "${aws_s3_bucket.bootcamp_s3.bucket_domain_name}"
        origin_id = "bootcamps3bucket"
    }

    enabled = true

    is_ipv6_enabled = true

    comment = "CF distribution for ${var.s3_bucket}"

    aliases = [
        "${var.s3_bucket}"
    ]

    default_cache_behavior = {
        allowed_methods = [
            "GET",
            "HEAD"
        ]

        cached_methods = [
            "GET",
            "HEAD"
        ]

        target_origin_id = "bootcamps3bucket"

        forwarded_values {
            query_string = false
            cookies {
                forward = "none"
            }
        }

        viewer_protocol_policy = "allow-all"

        min_ttl = 0
        default_ttl = 0
        max_ttl = 0
    }

    price_class = "PriceClass_100"

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    viewer_certificate  {
        cloudfront_default_certificate = true
    }

}