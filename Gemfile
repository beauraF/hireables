# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '6.0.2.2'

gem 'bootsnap', require: false
gem 'capybara'
gem 'faraday'
gem 'faraday-http-cache'
gem 'figaro'
gem 'octokit'
gem 'pg'
gem 'puma'
gem 'rack-attack'
gem 'rack-cors'
gem 'rack-timeout'
gem 'selenium-webdriver'
gem 'turbolinks'
gem 'webdrivers'
gem 'webpacker'

group :development, :test do
  gem 'brakeman', require: false
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'bullet'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :production do
  gem 'sentry-raven'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
