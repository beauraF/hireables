# frozen_string_literal: true

Rails.application.config.action_mailer.default_options = {
  from: ENV.fetch('ACTION_MAILER_DEFAULT_FROM'),
}

Rails.application.config.action_mailer.default_url_options = {
  host: ENV.fetch('APPLICATION_HOST'),
  port: ENV.fetch('APPLICATION_PORT').to_i.nonzero?,
}
