# frozen_string_literal: true

class Sentry
  def initialize(exception)
    if defined?(Raven)
      Raven.capture_exception(exception)
    else
      Rails.logger.error exception.full_message(order: :top)
    end
  end
end
