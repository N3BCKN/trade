# frozen_string_literal: true

class ProfilesController < ApplicationController
  def show_profile
    @contact = Contact.find_by(id: current_user)
    @offers   = Lead.profile_leads('offer', current_user).count
    @products = Lead.profile_leads('product', current_user).count
  end

  def show_products
    @leads = Lead.profile_leads('product', current_user)
                 .page(params[:page])
  end

  def show_offers
    @leads = Lead.profile_leads('offer', current_user)
                 .page(params[:page])
  end

  def show_messages
    @messages = Message.where(user_id: current_user)
                       .page(params[:page])
  end

  def show_favorites
    @fav_leads = Kaminari
                 .paginate_array(FavoriteLead.aggregate_leads(current_user))
                 .page(params[:page])
                 .per(20)
  end

  def profile_membership
  end
end
