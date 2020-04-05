# frozen_string_literal: true

FactoryBot.define do
  factory :export do
    email
    location { 'Paris' }
    language { 'Ruby' }
  end
end
