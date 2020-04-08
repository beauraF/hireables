# frozen_string_literal: true

require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  test 'external_id uniqueness' do
    create(:developer, external_id: 1)
    assert build(:developer, external_id: 1).invalid?
  end

  test 'username format' do
    assert build(:developer, username: '').invalid?
    assert build(:developer, username: 'username_with_invalid_characters!').invalid?
    assert build(:developer, username: 'username_ended_by_an_hyphen-').invalid?
    assert build(:developer, username: 'username_with_more_than_thirty_eight_characters').invalid?
  end

  test 'username uniqueness' do
    create(:developer, username: 'bilbon')
    assert build(:developer, username: 'bilbon').invalid?
  end

  test 'email is valid' do
    assert build(:developer, email: 'bilbon.sacquet@email').invalid?
  end

  test 'blog is a valid URL' do
    assert build(:developer, blog: 'http://www.skyrock').invalid?
  end
end
