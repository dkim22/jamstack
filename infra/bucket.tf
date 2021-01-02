resource "aws_s3_bucket" "jam_bucket" {
  bucket = "jamstack-terraform-dkim22-1"
  force_destroy = true
  policy = "${data.aws_iam_policy_document.jam_bucket_policy.json}"
}

data "aws_iam_policy_document" "jam_bucket_policy" {
  statement {
    actions = ["s3:GetObject"]
    resources = ["arn:aws:s3:::jamstack-terraform-dkim22-1/*"]

    principals {
      type = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.jam_access_id.iam_arn}"]
    }
  }

  statement {
    actions = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::jamstack-terraform-dkim22-1"]

    principals {
      type = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.jam_access_id.iam_arn}"]
    }
  }
}
