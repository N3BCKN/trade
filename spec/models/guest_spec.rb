# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Guest, type: :model do
	subject { described_class.new(email: "email@email.com")}
  describe 'Validations' do
  	it 'should be valid with valid params' do
  		expect(subject).to be_valid
  	end 
  	it 'should be saved' do
  		expect(subject.save).to eq(true)
  	end 
  	describe 'email' do
  		it 'should be present' do
  			subject.email = nil
  			expect(subject).to_not be_valid
  		end
  		it 'should be an email' do
  			subject.email = "not_an_email"
  			expect(subject).to_not be_valid
  			subject.email = "email.com"
  			expect(subject).to_not be_valid
  		end 
  	end 
  end
  describe 'Assosiations' do
  	it 'must has many views' do
      assc = described_class.reflect_on_association(:views)
      expect(assc.macro).to eq(:has_many)
    end
  end
end
