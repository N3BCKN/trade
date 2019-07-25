# frozen_string_literal: true

class Abuse < ApplicationRecord
  belongs_to :lead
  belongs_to :user

  validates :content, length: { minimum: 5, maximum: 850 }, presence: true
  validates :link, presence: true, length: { minimum: 8 }
end
