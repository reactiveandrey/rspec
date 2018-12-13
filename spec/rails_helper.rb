# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

require 'sidekiq/testing'
require 'capybara/rails'

Capybara.javascript_driver = :selenium
Capybara.app_host = "http://staging.lobster.media"
Capybara.run_server = false

require_relative 'support/webmock.rb'
require_relative 'support/vcr.rb'
require_relative 'support/factory_girl.rb'

RSpec.configure do |config|
  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  include Ilobster::SourceAPIStubs
  config.before(:example) do
    Sidekiq::Testing.fake!
    stub_media_download
    stub_flickr_api_list
  end

  config.include Devise::TestHelpers, type: :controller
  config.include Devise::TestHelpers, type: :view

  Stripe.api_key = 'stub'
end
