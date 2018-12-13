require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick
  
  processor :watermark do |content|
    content.shell_update do |old_path, new_path|
      "composite -compose atop -gravity center #{Rails.root}/public/watermark.png #{old_path} #{new_path}"
    end
  end
  
  processor :retina_watermark do |content|
    content.shell_update do |old_path, new_path|
      "composite -compose atop -gravity center #{Rails.root}/public/watermark_retina.png #{old_path} #{new_path}"
    end
  end
  
  processor :black_thumb do |content, width, height|
    content.process! :convert, "-thumbnail #{width}x#{height} -background black -gravity center -extent #{width}x#{height} -quality 90 -strip"
  end

  secret "e577668a17fe76a3db9791a99a92dc5ee3699160e6850fd0b5e7d549cd739229"

  url_format "/media/:job/:name"

  datastore :s3,
      bucket_name: ENV['S3_BUCKET'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  
  if Rails.env.production?
    url_host 'https://cdn0.lobster.media'
    url_format "/media/:job/:sha/:name"
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware
