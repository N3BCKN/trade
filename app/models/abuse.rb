# frozen_string_literal: true

class Abuse < ApplicationRecord
  belongs_to :lead
  belongs_to :user

  validates :content, length: { minimum: 4, maximum: 850 }, presence: true
  validates :link, presence: true
end
