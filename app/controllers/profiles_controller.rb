class ProfilesController < ApplicationController
  def show_profile
  	@contact = Contact.find(current_user.id)
  end

  def show_products
  	@leads = Lead.profile_lead("product", current_user.id)
    .page params[:page]
  end

  def show_offers
  	@leads = Lead.profile_lead("offer", current_user.id)
    .page params[:page]
  end

  def show_messages
    @messages = Message.where(user_id: current_user.id)
  end
end