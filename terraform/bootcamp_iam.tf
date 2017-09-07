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