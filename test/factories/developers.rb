# frozen_string_literal: true

FactoryBot.define do
  factory :developer do
    sequence(:external_id)
    login { "github_user_#{external_id}" }
  end
end
