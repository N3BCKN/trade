require 'elasticsearch/model'

class Lead < ApplicationRecord

  include Searchable  
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  belongs_to :category
  has_many   :messages
  
  scope :profile_leads, -> (status, current_user){
    where(lead_status: status,user: current_user)
  }

  validates :title, presence: true, length: {minimum: 5, maximum: 80}
  validates :description, presence: true, length: {minimum: 5, maximum: 1800}
  validates :lead_status, presence: true, length: {minimum: 5, maximum: 7}
  validates :contact_person, length: {minimum: 5, maximum: 120}
  validates :address, length: {minimum: 5, maximum: 120}
  validates :city, length: {minimum: 3, maximum: 80}
  validates :zip_code, length: {minimum: 4, maximum: 25}
  validates :country, length: {minimum: 2, maximum: 8}
  validates :phone_number, length: {minimum: 7, maximum: 30}
  validates :home_page, length: {minimum: 4, maximum: 120}

  has_attached_file :product_image, styles: { default: "650x400>", thumb: "150x120>" },
  default_url: "/images/:style/default_product_image.png"
  validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\z/

  before_save :set_short_descritption

  paginates_per 20
  acts_as_paranoid

  private
  def set_short_descritption
    self.description_short = (self.description.length > 300) ? self.description.slice(0..300) : self.description
  end

end


