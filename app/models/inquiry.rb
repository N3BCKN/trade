# frozen_string_literal: true

class Inquiry < ApplicationRecord
  belongs_to :user, optional: true

  validates :name,    presence: true, length: { minimum: 2, maximum: 70 }
  validates :email,   presence: true, length: { minimum: 4, maximum: 80 }, email_format: { message: 'email is not valid' }
  validates :subject, presence: true, length: { minimum: 5, maximum: 80 }
  validates :message, presence: true, length: { minimum: 5, maximum: 2500 }
end
