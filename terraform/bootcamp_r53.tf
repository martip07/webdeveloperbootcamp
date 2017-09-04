resource "aws_route53_record" "bootcamp_r53" {
    zone_id = "${var.r53_zone}"
    name = "${var.s3_bucket}"
    type = "${var.r53_record_type}"
    ttl = "300"
    records = [
        "${aws_cloudfront_distribution.bootcamp_cf.domain_name}"
    ]
}