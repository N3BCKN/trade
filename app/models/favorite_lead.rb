# frozen_string_literal: true

class FavoriteLead < ApplicationRecord
  belongs_to :user
  belongs_to :lead

  scope :aggregate_leads, lambda { |user|
    @user_leads = []
    where(user: user).find_each do |favorite|
      @user_leads.push(favorite.lead)
    end
    @user_leads
  }
end
