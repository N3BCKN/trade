# frozen_string_literal: true

module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :whitelist_params, if: :devise_controller?
  end

  def whitelist_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:terms_of_use])
  end
end
