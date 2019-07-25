# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FavoriteLead, type: :model do
  describe "Assosiations" do
  	it 'must belongs to user' do
  		assc = described_class.reflect_on_association(:user)
    	expect(assc.macro).to eq(:belongs_to)
  	end 
  	it 'must belongs to lead' do
  		assc = described_class.reflect_on_association(:lead)
    	expect(assc.macro).to eq(:belongs_to)
  	end 
  end 
end
