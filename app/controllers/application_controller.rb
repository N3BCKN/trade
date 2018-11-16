class ApplicationController < ActionController::Base

  include DeviseWhitelist
  include DynamicViews

  before_action :authenticate_user!
end
