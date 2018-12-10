class ProfilesController < ApplicationController

  def show_profile
  	@contact = Contact.find_by_id(current_user)
    @offers  = Lead.where(lead_status: "offer").count
    @product = Lead.where(lead_status: "product").count
  end

  def show_products
  	@leads = Lead.profile_leads("product", current_user.id)
    .page(params[:page])
  end

  def show_offers
  	@leads = Lead.profile_leads("offer", current_user.id)
    .page(params[:page])
  end

  def show_messages
    @messages = Message.where(user_id: current_user.id)
    .page(params[:page])
  end

  def show_favorites
  end

  def profile_membership
  end
end
 