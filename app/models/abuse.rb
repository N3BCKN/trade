# frozen_string_literal: true

class Abuse < ApplicationRecord
  belongs_to :lead
  belongs_to :user
end
