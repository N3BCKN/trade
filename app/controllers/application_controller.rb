# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include CountLeads

  before_action :authenticate_user!
  before_action :leads_number, if: :devise_controller?

  def render_not_found
    render file: "#{Rails.root}/public/404.html", status: 404
  end
end
