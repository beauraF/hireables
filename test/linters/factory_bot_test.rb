# frozen_string_literal: true

require 'test_helper'

class FactoryBotTest < ActiveSupport::TestCase
  test 'lint all factories' do
    FactoryBot.lint(traits: true, verbose: true)
  end
end
