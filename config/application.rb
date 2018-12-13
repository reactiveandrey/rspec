require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "rails/test_unit/railtie"
require "sprockets/railtie"
require "active_model/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ilobster
  class Application < Rails::Application
    Mongoid.logger.level = Logger::ERROR

    config.paths.add 'app/api', glob: '**/*.rb'
    config.autoload_paths += %W(
      #{config.root}/lib
      #{config.root}/app/workers
      #{config.root}/app/services
    )

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'London'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en
    config.i18n.enforce_available_locales = true

    config.active_support.escape_html_entities_in_json = true

    config.action_mailer.default_url_options = { :host => ENV['HOST_NAME'] }

    config.generators do |g|
      g.test_framework      :rspec
      g.helper              false
      g.javascripts         false
      g.stylesheets         false
    end

    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      html_tag
    }

    config.exceptions_app = self.routes

    config.middleware.delete Rack::Lock
    config.middleware.use(Rack::Tracker) do
      handler :google_tag_manager, { container: ENV['GOOGLE_TAG_MANAGER_CONTAINER'] }
    end
    config.middleware.use FayeRails::Middleware,
      mount: '/faye',
      server: 'puma',
      engine: {
        type: Faye::Redis,
        host: ENV['FAYE_REDIS_HOST'].presence || ENV['REDIS_HOST'],
        database: ENV['FAYE_REDIS_DATABASE'].presence || 0
      },
      timeout: 25 do
        map '/search/requests' => Api::V1::Search::SocketController
        map '/search/requests/**' => Api::V1::Search::SocketController
        map '/search2/requests' => SocketController
        map '/search2/requests/**' => SocketController
        map '/purchases' => SocketController
        map '/purchases/**' => SocketController
        map '/fetching/**' => SocketController
        map :default => :block
    end
  end
end
