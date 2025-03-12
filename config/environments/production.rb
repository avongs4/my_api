
require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot for better performance and memory savings.
  config.eager_load = true

  # Full error reports are disabled.
  config.consider_all_requests_local = false

  # Cache assets for far-future expiry.
  config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{1.year.to_i}" }

  # Enforce SSL security
  config.force_ssl = true

  # # Logging setup
  # config.log_tags = [:request_id]
  # config.logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
  # config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info").to_sym

  config.log_level = :debug
  config.log_tags = [:request_id]
  config.logger = ActiveSupport::Logger.new(Rails.root.join("log", "production.log"), 1, 50.megabytes)


  # Ignore deprecation warnings in production
  config.active_support.report_deprecations = false

  # **Redis Cache Store**
  config.cache_store = :redis_cache_store, {
    url: ENV.fetch("REDIS_URL", "redis://localhost:6379/1"),
    expires_in: 90.minutes
  }

  # **Use Sidekiq for Background Jobs**
  config.active_job.queue_adapter = :sidekiq
  # config.active_job.queue_adapter = :inline
  # config.active_job.queue_adapter = :async



  # Set ActionMailer URL
  config.action_mailer.default_url_options = { host: ENV.fetch("APP_HOST", "example.com") }

  # Enable locale fallbacks
  config.i18n.fallbacks = true

  # Prevent schema dump after migrations
  config.active_record.dump_schema_after_migration = false

  # Ensure proper DNS rebinding protection
  config.hosts << ENV.fetch("APP_HOST", "example.com")
end
