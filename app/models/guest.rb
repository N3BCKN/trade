# frozen_string_literal: true

class Guest < ApplicationRecord
  has_many :views, dependent: :destroy

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
