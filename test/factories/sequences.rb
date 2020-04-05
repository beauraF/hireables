# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "user_#{n}@email.com"
  end
end
