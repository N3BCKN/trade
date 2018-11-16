class ProfilesController < ApplicationController
  before_action :set_page_title
  def show_profile
  	@contact = Contact.where(user_id: current_user.id)
  end

  def show_products
  	@leads = Lead.profile_leads("product", current_user.id)
    .page params[:page]
  end

  def show_offers
  	@leads = Lead.profile_leads("offer", current_user.id)
    .page params[:page]
  end

  def show_messages
    @messages = Message.where(user_id: current_user.id)
  end

  private 
  def set_page_title
   @page_title = "#{current_user.user_name}, my profile | Trade"
  end
end
