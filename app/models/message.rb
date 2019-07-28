# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :lead, optional: true
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User', optional: true

  validates :country, length: { minimum: 2, maximum: 80 }, allow_blank: true
  validates :phone_number, length: { minimum: 7, maximum: 30 }, allow_blank: true
  validates :content, presence: true, length: { minimum: 7, maximum: 1500 }
  validates :contact_person, length: { minimum: 4, maximum: 60 }
  validates :email, presence: true, email_format: { message: 'email is not valid' }
end
