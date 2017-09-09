resource "aws_s3_bucket" "bootcamp_s3" {
    bucket = "${var.s3_bucket}"
    acl = "${var.s3_acl}"

    website {
        index_document = "index.html"
        error_document = "error.html"
    }
}

resource "aws_s3_bucket" "bootcamp_cpp_artifact" {
    bucket = "${var.s3_ccp_artifact}"
    acl = "${var.s3_acl_cpp}"
}