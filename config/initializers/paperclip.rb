Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_credentials] = \
  {
    bucket: ENV['S3_BUCKET'],
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }


AWS.config(stub_requests: true) if Rails.env.test?

Paperclip::Attachment.default_options[:path] = '/system/:class/:attachment/:id_partition/:style/:hash.:extension'

Paperclip.options[:command_path] = '/usr/bin/convert' if Rails.env.development?
