# frozen_string_literal: true

class SentryJob < ApplicationJob
  queue_as :sentries

  def perform(event)
    Raven.send_event(event)
  end
end
