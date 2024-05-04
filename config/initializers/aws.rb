Aws.config.update(
  credentials: Aws::Credentials.new(Rails.application.credentials.aws_access_key_id, Rails.application.credentials.aws_secret_access_key),
  region: 'us-west-2'
)
