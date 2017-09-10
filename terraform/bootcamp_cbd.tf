resource "aws_codebuild_project" "bootcamp_cbd" {
    name = "${var.cdb_name_bootcamp}"
    description = "Codebuild for bootcamp tutorials"
    build_timeout = "10"
    service_role = "${aws_iam_role.bootcamp_cdb_role.arn}"

    artifacts {
        type = "S3"
        location = "${aws_s3_bucket.bootcamp_cdb_artifact.bucket}"
        namespace_type = "BUILD_ID"
    }

    environment {
        compute_type = "BUILD_GENERAL1_SMALL"
        image = "${var.cdb_ecr_image_bootcamp}"
        type = "LINUX_CONTAINER"
    }

    source {
        type = "GITHUB"
        location = "https://github.com/martip07/webdeveloperbootcamp.git"
        auth = {
            type     = "OAUTH"
            resource = "AWS CodeBuild"
        }
    }

    tags {
        "Environment" = "master"
    }
}