
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

    # ✅ Secure CORS Configuration
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins ENV.fetch("CORS_ALLOWED_ORIGINS", "*") # Restrict in production
        resource "*", headers: :any, methods: %i[get post put delete options]
      end
    end

    # ✅ Ensure Sidekiq is used for background jobs
    config.active_job.queue_adapter = :sidekiq

    # ✅ Optimize middleware for API-only
    config.middleware.delete ActionDispatch::Static
    config.middleware.delete Rack::Sendfile
  end
end
