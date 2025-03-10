
require_relative "boot"


require "rails"
require "action_controller/railtie" # Enables ActionController in API mode
require "active_record/railtie"
require "action_mailer/railtie"
require "active_job/railtie"
# require "action_cable/engine"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Enable API-only mode (disables views, assets, and other middleware)
    config.api_only = true

    # ✅ Ensure CORS is set up correctly for cross-origin requests
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # Allow requests from any domain
        resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
      end
    end
  end
end

