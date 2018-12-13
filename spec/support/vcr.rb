require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "#{Rails.root}/spec/fixtures/vcr"
  # c.default_cassette_options = { record: :none }
  c.hook_into :webmock
  c.debug_logger = File.open("#{Rails.root}/log/network.log", 'w')
  c.ignore_localhost = true
end
