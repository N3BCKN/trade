# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include DeviseWhitelist

  before_action :authenticate_user!

  def render_not_found
    render :file => "#{Rails.root}/public/404.html",  :status => 404
  end
end
