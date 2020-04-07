# frozen_string_literal: true

require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  test 'external_id presence' do
    assert build(:developer, external_id: nil).invalid?
  end

  test 'external_id uniqueness' do
    create(:developer, external_id: 1)
    assert build(:developer, external_id: 1).invalid?
  end

  test 'login format' do
    assert build(:developer, login: '').invalid?
    assert build(:developer, login: 'login_with_invalid_characters!').invalid?
    assert build(:developer, login: 'login_with_invalid_characters!').invalid?
    assert build(:developer, login: 'login_ended_by_an_hyphen-').invalid?
    assert build(:developer, login: 'login_with_more_than_thirty_eight_characters').invalid?
  end

  test 'login uniqueness' do
    create(:developer, login: 'bilbon')
    assert build(:developer, login: 'bilbon').invalid?
  end

  test 'email is valid' do
    assert build(:developer, email: 'bilbon.sacquet@email').invalid?
  end

  test 'blog is a valid URL' do
    assert build(:developer, blog: 'http://www.skyrock').invalid?
  end
end
