# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Assosiations' do
    it 'hases many leads' do
      assc = described_class.reflect_on_association(:leads)
      expect(assc.macro).to eq(:has_many)
    end
  end
end
