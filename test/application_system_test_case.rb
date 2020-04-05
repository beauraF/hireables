# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  browser = ENV.fetch('SYSTEM_TEST_BROWSER', :chrome).to_sym

  driven_by :selenium, using: browser, screen_size: [1400, 1400] do |driver_option|
    driver_option.add_argument('no-sandbox')
  end
end
