# frozen_string_literal: true

return unless defined?(Bullet)

Rails.application.config.after_initialize do
  Bullet.enable = true
  Bullet.console = true
  Bullet.rails_logger = true
end
