source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '~> 4.1.13'
gem 'rails_autolink'
gem 'sprockets', '< 3.0.0'
gem 'grape'
gem 'grape-entity'

# API wrappers and services.
gem 'instagram', '~> 1.1.6'
gem 'flickraw'
gem 'google-api-client'
gem 'fb_graph2', '~> 0.7.8'
gem 'vkontakte_api', '~> 1.4'
gem 'paypal_adaptive'
gem 'paypal-sdk-adaptiveaccounts'
gem 'paypal-sdk-merchant'
gem 'stripe'
gem 'stripe_event'
gem 'geocoder'
gem 'foursquare2'
gem 'gibbon' # Mailchimp
gem 'wombat'
gem 'picasa', github: 'LobsterIT/picasa'
gem 'yandex-translator'
gem 'geoip', '~> 1.4.0'
gem 'dropbox-sdk', github: 'teoucsb82/dropbox-sdk-ruby', branch: 'chore/consolidate_test_unit_dependencies'

# Database.
gem 'mongoid', '~> 5.1.0'
gem 'mongoid-slug'
gem 'mongoid-locker', '~> 0.3.4'
gem 'bson_ext'
gem 'mongoid_paranoia'
gem 'mongoid_rails_migrations', '~> 1.0.0'
gem 'paperclip', '~> 4.2'
gem 'mongoid-paperclip', require: 'mongoid_paperclip'
gem 'kaminari'
gem 'mongoid-votable', github: 'LobsterIT/mongoid-votable'

# Admin page.
gem 'ransack', github: 'LobsterIT/ransack', branch: 'master'
gem 'activeadmin', github: 'LobsterIT/active_admin', branch: 'mongoid-old'
gem 'jquery-ui-rails'
# gem 'active_admin_editor', '~> 1.1.0'

# Search
gem 'elasticsearch', '~> 1.0.6'
gem 'elasticsearch-rails', '~> 0.1.6'
gem 'elasticsearch-model', '~> 0.1.6'
gem 'elasticsearch-persistence', '~> 0.1.6'
gem 'celluloid', '~> 0.16.0'
gem 'faye-rails', '~> 2.0.1'
gem 'puma'
gem 'faye-redis'
gem 'rumoji', github:'mwunsch/rumoji'
gem 'stanford-core-nlp'

gem 'dragonfly', '~> 1.0.7'
gem 'dragonfly-s3_data_store',
    github: 'LobsterIT/dragonfly-s3_data_store',
    branch: 'patch-1'

gem 'progress_bar', require: false
gem 'fastimage'
gem 'ruby-stemmer', require: 'lingua/stemmer'

# User login/registration and management.
gem 'devise', '~> 3.5.10'
gem 'devise-async'
gem 'omniauth'
gem 'omniauth-facebook', '~> 4.0.0'
gem 'omniauth-instagram'
gem 'omniauth-flickr'
gem 'omniauth-vkontakte'
gem 'omniauth-vimeo'
gem 'omniauth-dropbox-oauth2'
gem 'omniauth-google-oauth2',
    git: 'https://github.com/LobsterIT/omniauth-google-oauth2',
    branch: 'master'
gem 'omniauth-verizon',
    git: 'git@github.com:LobsterIT/omniauth-verizon.git',
    branch: 'master'

# Parallel requests and tasks.
gem 'typhoeus'
gem 'httpclient', '~> 2.5.1'
gem 'parallel'

# ZIP archives.
gem 'rubyzip', '>= 1.0.0'
gem 'zip-zip'

# PDF
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# Email validator.
gem 'valid_email'

# Get image EXIF data.
gem 'mini_exiftool'

# Working with colors
gem 'color'
gem 'miro'

# Background jobs.
gem 'sidekiq'
gem 'sinatra', '>= 1.3.0', require: nil

# aws gem to use S3
gem 'aws-sdk', '< 2.0'

# Caching
gem 'redis-rails'

# Tracking
gem 'mengpaneel', github: 'LobsterIT/mengpaneel'
gem 'rack-tracker', github: 'LobsterIT/rack-tracker'

# Money
gem 'money-rails'
gem 'countries'
gem 'google_currency'
gem 'country_select'

# Notifications
gem 'hipchat'
gem 'slack-notifier'

# Caching for Dragonfly
# gem 'rack-cache', :require => 'rack/cache'

# API
gem 'active_model_serializers', '~> 0.9'

gem 'slim'
gem 'slim-rails'

# Monitoring
group :production, :staging do
  gem 'newrelic_rpm'
end

group :development, :staging do
  gem 'rack-mini-profiler'
end

# Code organization
gem 'draper'

group :development do
  gem 'meta_request'
  gem 'shog'
  gem 'quiet_assets'
  gem 'foreman'
  gem 'pry-rails'
  # Debug and profiling.
  gem 'pry-byebug'
  gem 'hirb'
  gem 'ruby-prof'

  # Errors.
  gem 'execjs'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'

  # Use Unicorn for Development.
  gem 'unicorn-rails'

  # Mailing
  gem 'letter_opener'
  gem 'letter_opener_web'

  # Automatically run specs
  gem 'guard-rspec', require: false

  # Automatically reload browser when "view" changes
  gem 'guard-livereload', require: false

  gem 'factory_girl_rails', "~> 4.0"
  gem 'ffaker'
  gem 'nokogiri', require: false
end

group :test do
  # Test framework.
  gem 'rspec-rails'
  gem 'rspec-mocks'

  # Mock external API calls.
  gem 'webmock'
  gem 'stripe-ruby-mock', '~> 2.2.1', require: 'stripe_mock'

  # Record real API requests during tests.
  gem 'vcr'

  # Clean state for test runs.
  gem 'database_cleaner', '~> 1.5'
  gem 'simplecov'

  # CA - PY - BA - RA
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :development, :test do
  # Environment variables
  gem 'dotenv-rails'
end

# Gems used only for assets and not required in production environments by
# default.
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

gem 'tinymce-rails'
gem 'therubyracer', group: [:development, :assets]
gem 'jquery-rails'

# Bower
source 'https://rails-assets.org' do
  gem 'rails-assets-Justified-Gallery', '3.6.3'
  gem 'rails-assets-greensock'
  gem 'rails-assets-jquery.BlackAndWhite'
  gem 'rails-assets-scrollNav'
  gem 'rails-assets-jquery.cookieBar'
  gem 'rails-assets-SelectOrDie'
  gem 'rails-assets-wnumb'
  gem 'rails-assets-lodash'
  gem 'rails-assets-nouislider', '9.1.0'
  gem 'rails-assets-youarei'
  gem 'rails-assets-spectrum'
  gem 'rails-assets-skrollr'
  gem 'rails-assets-clipboard'
  gem 'rails-assets-jquery.autoellipsis'
  gem 'rails-assets-fullpage.js', '2.8.4'
  gem 'rails-assets-particles.js'
  gem 'rails-assets-card'
  gem 'rails-assets-imagesloaded'
  gem 'rails-assets-ev-emitter'
  gem 'rails-assets-animate.css'
  gem 'rails-assets-slick-carousel'
  gem 'rails-assets-jquery-emoji-picker'
  gem 'rails-assets-malihu-custom-scrollbar-plugin'
  gem 'rails-assets-foundation-datepicker'
end

gem 'fog', require: 'fog/aws/storage'
gem 'asset_sync'
gem 'sitemap_generator'
