# frozen_string_literal: true

class Export < ApplicationRecord
  enum status: {
    pending: 'pending',
    started: 'started',
    error: 'error',
    done: 'done',
  }

  validates :email, presence: true
  validates :email, format: { with: /\A[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+\z/ }, if: -> { email? }
  validate :location_or_language_presence
  validate :quota_not_exceeded, on: :create

  before_create :set_uuid
  after_create_commit :run

  def filename
    "#{uuid}.csv"
  end

  def path
    File.join(Dir.tmpdir, filename)
  end

  private

  def location_or_language_presence
    return if location? || language?

    errors.add(:base, "Location and language can't both be blank")
  end

  def quota_not_exceeded
    return if GITHUB.rate_limit!.remaining >= 1000

    errors.add(:base, 'Quota exceeded, please try again later')
  end

  def set_uuid
    self.uuid = SecureRandom.uuid
  end

  def run
    Export::RunJob.perform_later(self)
  end
end
