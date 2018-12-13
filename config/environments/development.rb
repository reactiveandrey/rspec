Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true
  # config.action_mailer.perform_deliveries = false
  config.action_mailer.delivery_method = ENV['USER'] == 'vagrant' ? :letter_opener_web : :letter_opener
  #config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address        => 'localhost',
    :port           => '1025'
  }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  config.action_view.raise_on_missing_translations = true

  # Custom config
  config.users_mailchimp_list_id  = 'bbede0a459'
  config.elasticsearch_host       = '127.0.0.1:9200'
  # config.elasticsearch_synonyms_path = Rails.root.join('config', 'synonyms', 'wn_s_nouns_only.pl').to_s
  config.elasticsearch_synonyms_path = '/usr/local/etc/elasticsearch/wn_s_nouns_only.pl'

  # Caching for Dragonfly
  # config.action_dispatch.rack_cache = true
  config.action_controller.perform_caching = true
end
