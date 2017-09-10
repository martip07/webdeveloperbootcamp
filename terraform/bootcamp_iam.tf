resource "aws_iam_role" "bootcamp_cdb_role" {
    name = "${var.iam_role_cdb_bootcamp}"
    assume_role_policy = "${var.iam_role_policy_cdb_bootcamp}"
}

resource "aws_iam_policy" "bootcamp_cdb_plcy" {
    name = "${var.iam_policy_name_cdb_bootcamp}"
    path = "/service-role/"
    description = "Policy for bootcamp codebuild"
    policy = "${var.iam_policy_cdb_bootcamp}"
}

resource "aws_iam_policy_attachment" "bootcamp_cdb_plcy_attach" {
    name = "${var.iam_policy_attachment_name_cdb_bootcamp}"
    policy_arn = "${aws_iam_policy.bootcamp_cdb_plcy.arn}"
    roles = [
        "${aws_iam_role.bootcamp_cdb_role.id}"
    ]
}

resource "aws_iam_role" "bootcamp_cpp_role" {
    name = "${var.iam_role_name_cpp_bootcamp}"
    assume_role_policy = "${var.iam_role_policy_cpp_bootcamp}"
}

resource "aws_iam_role_policy" "bootcamp_cpp_policy" {
    name = "${var.iam_policy_name_cpp_bootcamp}"
    role = "${aws_iam_role.bootcamp_cpp_role.id}"
    policy =    <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Action": [
        "s3:ListAllMyBuckets",
        "s3:ListBucket",
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning",
        "s3:PutObject"
      ],
      "Resource": [
        "${aws_s3_bucket.bootcamp_cpp_artifact.arn}",
        "${aws_s3_bucket.bootcamp_cpp_artifact.arn}/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:BatchGetBuilds",
        "codebuild:StartBuild"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}