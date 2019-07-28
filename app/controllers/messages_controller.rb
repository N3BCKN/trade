# frozen_string_literal: true

class MessagesController < ApplicationController
  include UserLimits

  before_action :check_user_restrictions, only: :create

  def create
    @lead = Lead.friendly.find(params[:id])
    @message = Message.create(message_params)
    @message.sender = current_user
    @message.lead = @lead

    respond_to do |format|
      if @message.save
        NotificationsMailer.send_lead_response(
          @message,
          @lead,
          params[:absolute_url]
        ).deliver_now

        format.html do
          redirect_to suggested_leads_path(params[:id])
        end
      else
        format.html do
          redirect_to lead_path(params[:id]),
            notice: "Message couldn't be delivered " + @message.errors.full_messages.to_sentence
        end
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(
      :content,
      :email,
      :phone_number,
      :country,
      :contact_person
    )
  end

  def check_user_restrictions
    @number_of_msgs = current_user.messages_sent
                                  .where('created_at >= ?', Time.current - 7.days)
                                  .count

    if @number_of_msgs >= user_limits(current_user.role, 'messages')
      respond_to do |format|
        format.html do
          redirect_to lead_path(params[:id]),
            notice: 'Your account has reached messages limit. Please try again later.'
        end
      end
    end
  end
end
