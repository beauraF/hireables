# frozen_string_literal: true

middleware = Faraday::RackBuilder.new do |builder|
  builder.use Faraday::HttpCache, serializer: Marshal, shared_cache: false
  builder.use Octokit::Response::RaiseError
  builder.adapter Faraday.default_adapter
end

Octokit.middleware = middleware

GITHUB = Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
