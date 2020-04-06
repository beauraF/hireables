# frozen_string_literal: true

return unless defined?(Raven)

Raven.configure do |config|
  config.dsn = ENV.fetch('SENTRY_DSN')
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)

  config.async = lambda do |event|
    SentryJob.perform_later(event)
  end
end
