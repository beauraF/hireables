# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  EMAIL_REGEX = /\A[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+\z/.freeze

  def validate_each(record, attribute, value)
    return if value.match?(EMAIL_REGEX)

    record.errors[attribute] << (options[:message] || 'is not a valid email address')
  end
end
