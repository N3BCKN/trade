class FavoriteLead < ApplicationRecord
  belongs_to :user
  belongs_to :lead

  scope :aggregate_leads, -> (user){
  	@user_leads = []
  	self.where(user: user).find_each do |favorite|
  		@user_leads.push(favorite.lead)
  	end
  	@user_leads
  }
end
