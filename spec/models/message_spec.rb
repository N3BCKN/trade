# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  subject do
    described_class.new(
      content:        'message content',
      email:          'email@email.com',
      contact_person: 'contact person',
      country:        'contact country',
      phone_number:   'phone number',
      sender:         User.new,
      lead:           Lead.new,
      receiver:       User.new
    )
  end

  describe 'Validations' do
    it 'must be valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'must be saved' do
      expect(subject.save).to eq(true)
    end
    describe 'content' do
      it 'must be present' do
        subject.content = nil
        expect(subject).not_to be_valid
      end
      it 'must be shorter then 1500 chars' do
        subject.content = '*'*1501
        expect(subject).not_to be_valid
      end
      it 'must be longer then 8 chars' do
        subject.content = '*'*7
        expect(subject).not_to be_valid
      end
    end

    describe 'email' do
      it 'must be an email' do
        subject.email = 'not email'
        expect(subject).not_to be_valid
        subject.email = 'email.com'
        expect(subject).not_to be_valid
      end
      it 'must be present' do
        subject.email = nil
        expect(subject).not_to be_valid
      end
    end

    describe 'contact_person' do
      it 'must be shorter then 120 chars' do
        subject.contact_person = '*'*121
        expect(subject).not_to be_valid
      end
      it 'must be longer then 5 chars' do
        subject.contact_person = '*'*4
        expect(subject).not_to be_valid
      end
    end

    describe 'country' do
      it 'must be shorter then 80 chars' do
        subject.country = '*'*81
        expect(subject).not_to be_valid
      end
      it 'must be longer then 2 chars' do
        subject.country = '*'
        expect(subject).not_to be_valid
      end
    end

    describe 'phone_number' do
      it 'must be shorter then 30 chars' do
        subject.phone_number = '*'* 31
        expect(subject).not_to be_valid
      end
      it 'must be longer then 7 chars' do
        subject.phone_number = '*' * 6
        expect(subject).not_to be_valid
      end
    end
  end

  describe 'Assosiations' do
    it 'must belongs to the lead' do
      assc = described_class.reflect_on_association(:lead)
      expect(assc.macro).to eq(:belongs_to)
    end
    it 'must belongs to the sender' do
      assc = described_class.reflect_on_association(:sender)
      expect(assc.macro).to eq(:belongs_to)
    end
    it 'must belongs to the receiver' do
      assc = described_class.reflect_on_association(:receiver)
      expect(assc.macro).to eq(:belongs_to)
    end
  end
end
