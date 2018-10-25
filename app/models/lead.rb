class Lead < ApplicationRecord

  belongs_to :user

  
  scope :products_all,-> { where(lead_status: "product") }
  scope :offers_all,  -> { where(lead_status: "offer") }


  validates :user_id, presence: true
  validates :title, presence: true, length: {minimum: 5, maximum: 80}
  validates :description, presence: true, length: {minimum: 5, maximum: 120}
  validates :lead_status, presence: true, length: {minimum: 5, maximum: 7}
  validates :contact_person, length: {minimum: 5, maximum: 120}
  validates :address, length: {minimum: 5, maximum: 120}
  validates :city, length: {minimum: 3, maximum: 80}
  validates :zip_code, length: {minimum: 5, maximum: 25}
  validates :country, length: {minimum: 4, maximum: 80}
  validates :phone_number, length: {minimum: 7, maximum: 30}
  validates :email, length: {minimum: 6, maximum: 80}
  validates :home_page, length: {minimum: 4, maximum: 120}

end
