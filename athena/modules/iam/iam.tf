
resource "aws_iam_role" "athena_role" {
  name = "athena-query-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "athena.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy" "athena_policy" {
  name = "athena-query-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:*",
          "glue:*",
          "athena:*",
          "logs:*"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "athena_attach" {
  role       = aws_iam_role.athena_role.name
  policy_arn = aws_iam_policy.athena_policy.arn
}
