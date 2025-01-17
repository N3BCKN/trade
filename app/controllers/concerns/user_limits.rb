# frozen_string_literal: true

module UserLimits
  extend ActiveSupport::Concern

  included do
    :user_limits
  end

  def user_limits(role, action)
    @limitations =
      {
        'regular' => {
          'leads'    => 20,
          'messages' => 10
        },
        'premium' => {
          'leads'    => 20,
          'messages' => 100
        },
        'elite'   => {
          'leads'    => 50,
          'messages' => 250
        }
      }

    @limitations[role][action]
  end
end
