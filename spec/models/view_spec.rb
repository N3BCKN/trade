# frozen_string_literal: true

require 'rails_helper'

RSpec.describe View, type: :model do
  describe 'Assosiations' do
    it 'must belongs to guest' do
      assc = described_class.reflect_on_association(:guest)
      expect(assc.macro).to eq(:belongs_to)
    end
  end
end
