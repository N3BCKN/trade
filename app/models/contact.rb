# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user

  serialize :areas_of_interest

  extend FriendlyId
  friendly_id :user_name, use: :slugged

  validates :address, length: { minimum: 5, maximum: 120 }, allow_blank: true
  validates :city, length: { minimum: 2, maximum: 80 }, allow_blank: true
  validates :zip_code, length: { minimum: 4, maximum: 25 }, allow_blank: true
  validates :country, length: { minimum: 2, maximum: 80 }, allow_blank: true
  validates :phone_number, length: { minimum: 7, maximum: 30 }, allow_blank: true
  validates :home_page, length: { minimum: 4, maximum: 120 }, allow_blank: true
  validates :company_description, length: { minimum: 5, maximum: 1600 }, allow_blank: true
  validates :year_of_establishment, inclusion: 1300..2024, allow_blank: true
  validates :number_of_employes, inclusion: 1..999_999, allow_blank: true
  validates :latitude, inclusion: -90..90, allow_blank: true
  validates :longitude, inclusion: -180..180, allow_blank: true

  has_attached_file :avatar, styles:      { default: '300x300>', tiny: '30x30>' },
                             default_url: '/images/:style/default_user_avatar.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\z}

  delegate :user_name, to: :user
end
