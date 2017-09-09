resource "aws_codepipeline" "bootcamp_cpp" {
    name = "${var.cpp_name_bootcamp}"
    role_arn = "${aws_iam_role.bootcamp_cpp_role.arn}"

    artifact_store = {
        location = "${aws_s3_bucket.bootcamp_cpp_artifact.bucket}"
        type = "S3"
    }

    stage {
        name = "Source"

        action {
            name = "Source"
            category = "Source"
            owner = "ThirdParty"
            provider = "GitHub"
            version = "1"
            output_artifacts = [
                "bootcamp_artifact"
            ]
            
            configuration {
                Owner = "${var.cpp_repo_owner}"
                Repo  = "${var.cpp_repo_name}"
                Branch = "master"
            }
        }
    }

    stage {
        name = "Build"

        action {
            name = "Build"
            category = "Build"
            owner = "AWS"
            provider = "CodeBuild"
            version = "1"
            input_artifacts = [
                "bootcamp_artifact"
            ]

            configuration {
                ProjectName = "${aws_codebuild_project.bootcamp_cbd.name}"
            }
        }
    }
}