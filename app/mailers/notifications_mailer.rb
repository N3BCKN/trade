# frozen_string_literal: true

class NotificationsMailer < ApplicationMailer
  def send_lead_response(message, lead, url_path)
  	attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")
    @message = message
    @lead    = lead
    @url     = url_path
    mail(to:      @lead.user.email,
         subject: "RE: #{lead.title}")
  end
end
