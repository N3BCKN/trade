# frozen_string_literal: true

class InquiriesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.user = current_user if current_user

    respond_to do |format|
      if @inquiry.save
        InquiryMailer.send_inquiry(@inquiry)
                     .deliver_now

        format.html do
          redirect_to root_path,
            notice: 'Thank you for your message. Our team will contact you as soon as possible'
        end
      else
        format.html do
          redirect_to contact_us_path,
            notice: 'Error. Your message could not be sent. Please try again: ' + @inquiry.errors.full_messages.to_sentence
        end
      end
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(
      :name,
      :subject,
      :email,
      :message
    )
  end
end
