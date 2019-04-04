# frozen_string_literal: true

class InquiryMailer < ApplicationMailer
  def send_inquiry(inquiry)
    @inquiry = inquiry
    # TODO: change email address to trade contact address in the future
    mail(to:      'test@test.com',
         subject: "Inquiry: #{@inquiry.subject}")
  end
end
