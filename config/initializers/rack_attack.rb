# frozen_string_literal: true

Rack::Attack.enabled = ENV.fetch('RACK_ATTACK_ENABLED', true)
