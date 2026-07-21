###############################################
# S3 Bucket Policy
###############################################

data "aws_iam_policy_document" "bucket_policy" {

  statement {

    sid = "AllowCloudFrontServicePrincipalReadOnly"

    effect = "Allow"

    principals {

      type = "Service"

      identifiers = [
        "cloudfront.amazonaws.com"
      ]

    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${module.s3.bucket_arn}/*"
    ]

    condition {

      test = "StringEquals"

      variable = "AWS:SourceArn"

      values = [
        module.cloudfront.distribution_arn
      ]

    }

  }

}