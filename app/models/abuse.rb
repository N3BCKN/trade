# frozen_string_literal: true

class Abuse < ApplicationRecord
  belongs_to :lead
  belongs_to :user

  validates :lead, length: { minimum: 4, maximum: 850 }
end
