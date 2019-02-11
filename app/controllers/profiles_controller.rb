# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :count_leads

  def show_profile
    @contact = Contact.find_by(id: current_user)
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
    @messages = Message.where(sender: current_user)
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

  private

  def count_leads
    @offers = Lead.profile_leads('offer', current_user).count
    @products = Lead.profile_leads('product', current_user).count
  end
end
