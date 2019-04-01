# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @categories = Category.all
    @offers = Lead.where(lead_status: 'offer').order('created_at desc').limit(6)
    @products = Lead.where(lead_status: 'product').order('created_at desc').limit(6)
  end
  
  def about
  end

  def terms
  end

  def privacy_policy
  end

  def faq
  end

  def email_marketing
  end

  def marketing_campaign
  end

  def post_lead_helper
  end

  def membership_status
  end

  def not_found
    render status: 404
  end
end
