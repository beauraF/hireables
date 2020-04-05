# frozen_string_literal: true

class ExportMailer < ApplicationMailer
  def completed(export)
    @export = export

    attachments[export.filename] = File.read(export.path)
    mail(to: export.email, subject: 'Your export is completed')
  end
end
