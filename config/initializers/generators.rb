# frozen_string_literal: true

Rails.application.config.generators do |generator|
  generator.assets false
  generator.helper false
  generator.test_framework :test_unit, fixture: false
end
