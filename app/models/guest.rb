class Guest < ApplicationRecord
	has_many :views, dependent: :destroy

	validates :email, presence: true
end
