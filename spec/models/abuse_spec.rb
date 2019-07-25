# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Abuse, type: :model do
 	describe 'Validations' do
 		subject { described_class.new(user: User.new, lead: Lead.new, content: "abuse content", link: "abuse link") }

 		it 'is valid with valid attributes' do
 			expect(subject).to be_valid
 		end
 		it 'must be saved' do
 			expect(subject.save).to eq(true)
 		end 

 		describe 'content' do
 			it 'must be present' do
 				subject.content = nil
 				expect(subject).to_not be_valid
 			end
 			it 'must be not longer then 850 chars' do
 				subject.content = "*"*851
 				expect(subject).to_not be_valid
 			end
 			it 'must be not shorter then 5 chars' do
 				subject.content = "*" * 4
 				expect(subject).to_not be_valid
 			end 
 		end
 		describe 'link' do
 			it 'must be present' do
 				subject.link = nil
 				expect(subject).to_not be_valid
 			end 
 			it 'must be not shorter then 8 chars' do
 				subject.link = "*"*7
 				expect(subject).to_not be_valid
 			end 
 		end

 		describe 'user' do
 			it 'must be present' do
 				subject.user = nil
 				expect(subject).to_not be_valid
 			end
 		end

 		describe 'lead' do
 			it 'must be present' do
 				subject.lead = nil
 				expect(subject).to_not be_valid
 			end
 		end
 	end 
 	describe 'Associations' do
 		it 'must belongs to the user' do
 			 assc = described_class.reflect_on_association(:user)
    		 expect(assc.macro).to eq(:belongs_to)
 		end
 		it 'must belongs to the lead' do 
 			assc = described_class.reflect_on_association(:lead)
    		expect(assc.macro).to eq(:belongs_to)
 		end 
 	end 
end
