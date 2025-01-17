# frozen_string_literal: true

require 'elasticsearch/model'

class Lead < ApplicationRecord
  include Searchable
  include SearchingModel
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  belongs_to :category
  has_many   :messages
  has_many   :favorite_leads

  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :profile_leads, lambda { |status, current_user|
    where(lead_status: status, user: current_user)
  }

  validates :title, presence: true, length: { minimum: 5, maximum: 80 }
  validates :description, presence: true, length: { minimum: 8, maximum: 1800 }
  validates :lead_status, presence: true, length: { minimum: 5, maximum: 7 }
  validates :contact_person, length: { minimum: 2, maximum: 120 }, allow_blank: true
  validates :country, presence: true, length: { minimum: 2, maximum: 8 }
  validates :phone_number, length: { minimum: 6, maximum: 30 }, allow_blank: true
  validates :destination, length: { minimum: 2, maximum: 85 }, allow_blank: true
  validates :quantity, length: { minimum: 2, maximum: 70 }, allow_blank: true
  validates :freqency, length: { minimum: 9, maximum: 24 }, allow_blank: true
  validates :prefered_suppliers, length: { minimum: 2, maximum: 55 }, allow_blank: true

  has_attached_file :product_image, styles:      { default: '450x350>', thumb: '150x150>' },
                                    default_url: 'default_image'
  validates_attachment_content_type :product_image, content_type: %r{\Aimage/.*\z}

  before_save :set_short_descritption

  paginates_per 20
  acts_as_paranoid

  private

  def set_short_descritption
    self.description_short = description.length > 300 ? description.slice(0..300) : description
  end

  def img_url_thumb
    product_image.url(:thumb)
  end
end
