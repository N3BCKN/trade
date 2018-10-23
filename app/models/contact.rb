class Contact < ApplicationRecord
  belongs_to :user


  validates :user_id, presence: true
  validates :address, length: {minimum: 5, maximum: 120}
  validates :city, length: {minimum: 3, maximum: 80}
  validates :zip_code, length: {minimum: 5, maximum: 25}
  validates :country, length: {minimum: 4, maximum: 80}
  validates :phone_number, length: {minimum: 9, maximum: 30}
  validates :email, length: {minimum: 6, maximum: 80}
  validates :home_page, length: {minimum: 4, maximum: 120}
  validates :company_description, length: {minimum: 5, maximum: 1600}
  validates :year_of_establishment, length: {minimum: 3, maximum: 4}

end
