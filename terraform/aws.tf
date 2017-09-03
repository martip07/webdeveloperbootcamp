provider "aws" {
    region = "${var.aws_region}"
    shared_credentials_file = "${var.aws_file_key}"
    profile = "${var.aws_profile_key}"
}