# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lead, elasticsearch: true, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # it 'is indexed' do
  #   expect(Lead.__elasticsearch__).to be_index_exists
  # end
  subject { described_class.new(
  	title: "lead title",
  	lead_status: "offer",
  	description: "lead description",
  	contact_person: "lead contact person",
  	country: "country",
  	phone_number: "lead phone number",
  	destination: "lead destination",
  	quantity: "lead quantity",
  	freqency: "lead freqency",
  	prefered_suppliers: "lead prefered suppliers",
  	category: Category.new,
  	user: User.new
  	)}

  describe "Validations" do
  	it 'must be valid with valid params' do
  		expect(subject).to be_valid
  	end 
  	it 'must be saved' do
  		expect(subject.save).to eq(true)
  	end
  	describe 'title' do
  		it 'must be present' do
  			subject.title = nil
  			expect(subject).to_not be_valid
  		end
  		it 'must be shorter then 80 chars' do
  			subject.title = "*" * 81
  			expect(subject).to_not be_valid
  		end
  		it 'must be longer then 5 chars' do
  			subject.title = "*" * 4
  			expect(subject).to_not be_valid
  		end 
  	end
  	describe 'lead_status' do
  		it 'must be present' do
  			subject.lead_status = nil
  			expect(subject).to_not be_valid
  		end
  		it 'must be shorter then 8 chars' do
  			subject.lead_status = "*" * 8
  			expect(subject).to_not be_valid
  		end
  		it 'must be longer then 4 chars' do
  			subject.lead_status = "*" * 4
  			expect(subject).to_not be_valid
  		end 
  	end
  	describe 'description' do
  		it 'must be present' do
  			subject.description = nil
  			expect(subject).to_not be_valid
  		end
  		it 'must be shorter then 1800 chars' do
  			subject.description = "*" * 1801
  			expect(subject).to_not be_valid
  		end
  		it 'must be longer then 8 chars' do
  			subject.description = "*" * 7
  			expect(subject).to_not be_valid
  		end 
  	end
  	describe 'country' do
  		it 'must be present' do
  			subject.country = nil
  			expect(subject).to_not be_valid
  		end 
  		it 'must be shorter then 8 chars' do
  			subject.country = "*" * 9
  			expect(subject).to_not be_valid
  		end
  		it 'must be longer then 2 chars' do
  			subject.country = "*" 
  			expect(subject).to_not be_valid
  		end 
  	end
  	describe 'contact_person' do
  		it 'must be shorter then 120 chars' do
  			subject.contact_person = "*" * 121
  			expect(subject).to_not be_valid
  		end
  		it 'must be longer then 2 chars' do
  			subject.contact_person = "*" 
  			expect(subject).to_not be_valid
  		end 
  	end
  	describe 'phone_number' do
  		it 'must be shorter then 30 chars' do
  			subject.phone_number = "*" * 31
  			expect(subject).to_not be_valid
  		end
  		it 'must be longer then 6 chars' do
  			subject.phone_number = "*" * 5
  			expect(subject).to_not be_valid
  		end 
  	end
  	describe 'destination' do
  		it 'must be shorter then 85 chars' do
  			subject.destination = "*" * 86
  			expect(subject).to_not be_valid
  		end
  		it 'must be longer then 2 chars' do
  			subject.destination = "*" 
  			expect(subject).to_not be_valid
  		end 
  	end
  	describe 'quantity' do
  		it 'must be shorter then 70 chars' do
  			subject.quantity = "*" * 71
  			expect(subject).to_not be_valid
  		end
  		it 'must be longer then 2 chars' do
  			subject.quantity = "*" 
  			expect(subject).to_not be_valid
  		end 
  	end
  	describe 'freqency' do
  		it 'must be shorter then 24 chars' do
  			subject.freqency = "*" * 25
  			expect(subject).to_not be_valid
  		end
  		it 'must be longer then 9 chars' do
  			subject.freqency = "*" * 8
  			expect(subject).to_not be_valid
  		end 
  	end
  	describe 'prefered_suppliers' do
  		it 'must be shorter then 55 chars' do
  			subject.prefered_suppliers = "*" * 56
  			expect(subject).to_not be_valid
  		end
  		it 'must be longer then 2 chars' do
  			subject.prefered_suppliers = "*" 
  			expect(subject).to_not be_valid
  		end 
  	end
  end 
  describe "Associations" do
  	it 'must belongs to the user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq(:belongs_to)
    end
    it 'must has many messages' do
      assc = described_class.reflect_on_association(:messages)
      expect(assc.macro).to eq(:has_many)
    end
    it 'must belongs to the category' do
      assc = described_class.reflect_on_association(:category)
      expect(assc.macro).to eq(:belongs_to)
    end
    it 'must has many favorites' do
      assc = described_class.reflect_on_association(:favorite_leads)
      expect(assc.macro).to eq(:has_many)
    end
  end 
end
