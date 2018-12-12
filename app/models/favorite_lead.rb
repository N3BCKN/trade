class FavoriteLead < ApplicationRecord
  belongs_to :user
  belongs_to :lead

  scope :aggregate_leads, -> (user){
  	@user_leads = []
  	FavoriteLead.where(user: user).each do |favorite|
  		@user_leads.push(favorite.lead)
  	end
  	@user_leads
  }
end
