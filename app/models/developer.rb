# frozen_string_literal: true

class Developer < ApplicationRecord
  validates :external_id, presence: true, uniqueness: true
  validates :username, format: { with: /\A([\w-]){0,37}\w{1}\z/ }, uniqueness: true
  validates :email, email: true, allow_blank: true
  validates :blog, url: true, allow_blank: true

  def profile_url
    URI.join(Rails.application.routes.url_helpers.github_url, username).to_s
  end
end
