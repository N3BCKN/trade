class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
  	@categories = Category.all
  end

  def contact
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
end
