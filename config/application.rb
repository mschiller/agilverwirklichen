require_relative "boot"

require "rails/all"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Framework
  class Application < Rails::Application
    config.to_prepare do
      # Load application's model / class decorators
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
      # Load libs
      Dir.glob(File.join(File.dirname(__FILE__), "../lib/**/*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
      # Load application's view overrides
      Dir.glob(File.join(File.dirname(__FILE__), "../app/overrides/*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.time_zone = "Berlin"

    # Ensuring that ActiveStorage routes are loaded before Comfy's globbing
    # route. Without this file serving routes are inaccessible.
    config.railties_order = [ActiveStorage::Engine, :main_app, :all]

    config.middleware.use Rack::Deflater

    #config.active_storage.variant_processor = :vips

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    if Rails.env.production?
      config.middleware.use ExceptionNotification::Rack,
                            email: {
                              email_prefix: Rails.env,
                              sender_address: "'Exception Notifier' <#{Figaro.env.email}>",
                              exception_recipients: Figaro.env.exception_notification_recipients,
                            }
    end
  end

  Rails.autoloaders.main.ignore("**/materialize-override/**")
end
