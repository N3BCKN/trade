# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  subject do
    described_class.new(
      name:    'inquiry name',
      email:   'email@email.com',
      subject: 'inquiry subject',
      message: 'inquiry message',
      user:    User.new
    )
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is saved' do
      expect(subject.save).to eq(true)
    end
    describe 'name' do
      it 'must be present' do
        subject.name = nil
        expect(subject).not_to be_valid
      end
    end

    describe 'email' do
      it 'must be present' do
        subject.email = nil
        expect(subject).not_to be_valid
      end
      it 'must be an email' do
        subject.email = 'not an email'
        expect(subject).not_to be_valid
        subject.email = 'email.com'
        expect(subject).not_to be_valid
      end
      it 'must be longer or equal then 4' do
        subject.email = '*'*3
        expect(subject).not_to be_valid
      end
      it 'must be shorter or equal to 80' do
        subject.email = '*'*81
        expect(subject).not_to be_valid
      end
    end

    describe 'subject' do
      it 'must be present' do
        subject.subject = nil
        expect(subject).not_to be_valid
      end
      it 'must be longer or equal then 5' do
        subject.subject = '*'*4
        expect(subject).not_to be_valid
      end
      it 'must be shorter or equal to 80' do
        subject.subject = '*'*81
        expect(subject).not_to be_valid
      end
    end

    describe 'message' do
      it 'must be present' do
        subject.message = nil
        expect(subject).not_to be_valid
      end
      it 'must be longer or equal then 5' do
        subject.message = '*'*4
        expect(subject).not_to be_valid
      end
      it 'must be shorter or equal to 2500' do
        subject.message = '*'*2501
        expect(subject).not_to be_valid
      end
    end
  end

  describe 'Associations' do
    it 'must belongs to the user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq(:belongs_to)
    end
  end
end
