# frozen_string_literal: true

require 'application_system_test_case'

class ExportsTest < ApplicationSystemTestCase
  test 'creating a Export' do
    visit root_url

    assert_text 'How it works?'

    fill_in 'Location', with: ''
    fill_in 'Language', with: ''
    fill_in 'Your email', with: 'bilbon.sacquet@email'
    click_on 'Search'

    assert_text 'Email is invalid'
    assert_text "Location and language can't both be blank"

    fill_in 'Location', with: 'Paris'
    fill_in 'Language', with: 'Ruby'
    fill_in 'Your email', with: 'bilbon.sacquet@email.com'
    click_on 'Search'

    assert_text <<~TEXT
      We have taken your search into account, an email with the results will be sent to you in a few minutes.
    TEXT
  end
end
