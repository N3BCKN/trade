class Contact < ApplicationRecord

  belongs_to :user


  validates :address, length: {minimum: 5, maximum: 120}, allow_blank: true
  validates :city, length: {minimum: 2, maximum: 80}, allow_blank: true
  validates :zip_code, length: {minimum: 4, maximum: 25}, allow_blank: true
  validates :country, length: {minimum: 2, maximum: 80}, allow_blank: true
  validates :phone_number, length: {minimum: 7, maximum: 30}, allow_blank: true
  validates :home_page, length: {minimum: 4, maximum: 120}, allow_blank: true
  validates :company_description, length: {minimum: 5, maximum: 1600}, allow_blank: true
  validates :year_of_establishment, length: {minimum: 3, maximum: 4}, allow_blank: true

  has_attached_file :avatar, styles: { default: "300x300>"}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
