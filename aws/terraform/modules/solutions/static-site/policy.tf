###############################################
# S3 Bucket Policy
###############################################

resource "aws_s3_bucket_policy" "this" {

  bucket = module.s3.bucket_id

  policy = data.aws_iam_policy_document.bucket_policy.json

}