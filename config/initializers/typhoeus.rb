Typhoeus.configure do |config|
  config.verbose = Rails.env == 'development'
  config.cache = false
  config.memoize = false
end