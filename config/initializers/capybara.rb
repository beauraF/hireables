# frozen_string_literal: true

Capybara.register_driver :crawler do |app|
  browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |options|
    options.add_argument('headless')
    options.add_argument('no-sandbox')
  end

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options).tap do |driver|
    driver.browser.manage.window.size = Selenium::WebDriver::Dimension.new(1920, 1080)
  end
end
