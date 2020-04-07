# frozen_string_literal: true

class UrlValidator < ActiveModel::EachValidator
  URL_REGEX = %r{
    https?://(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)
  }.freeze

  def validate_each(record, attribute, value)
    return if value.match?(URL_REGEX)

    record.errors[attribute] << (options[:message] || 'is not a valid URL')
  end
end
