# frozen_string_literal: true

GITHUB = Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
