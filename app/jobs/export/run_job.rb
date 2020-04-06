# frozen_string_literal: true

require 'csv'

class Export::RunJob < ApplicationJob
  queue_as :default

  before_perform do |job|
    job.arguments.first.started!
  end

  after_perform do
    @export.done!
    ExportMailer.completed(@export).deliver_later
  end

  rescue_from(StandardError) do |exception|
    @export.error!
    Sentry.new(exception)
  end

  HEADERS = %w[name email github company hireable?].freeze

  def perform(export) # rubocop:todo Metrics/AbcSize, Metrics/MethodLength
    @export = export

    CSV.open(@export.path, 'wb', headers: true) do |csv|
      csv << %w[name email github company hireable?]

      1.upto(10) do |page|
        response = GITHUB.search_users(query, page: page, per_page: 100)

        response.items.map(&:id).each do |id|
          user = GITHUB.user(id)
          csv << [user.name, user.email, user.html_url, user.company, user.hireable?]
        end

        break if response.items.size < 100
      end
    end
  end

  private

  def query
    @_query ||= { location: @export.location, language: @export.language }
                .reject { |_key, value| value.blank? }
                .transform_values { |value| CGI.escape(value) }
                .to_a
                .map { |qualifiers| qualifiers.join(':') }
                .join(' ')
  end
end
