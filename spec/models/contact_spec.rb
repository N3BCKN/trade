# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject do
    described_class.new(
    address:               'contact address',
    city:                  'contact city',
    zip_code:              'contact zipcode',
    country:               'contact country',
    phone_number:          'contact phone_number',
    email:                 'email@email.com',
    home_page:             'contact home page',
    company_description:   'contact description',
    year_of_establishment: 2019,
    number_of_employes:    12_345,
    annual_sales:          'sales',
    areas_of_interest:     'contact areas of interest',
    longitude:             40.730610,
    latitude:              -73.935242,
    user:                  User.new
  )
  end

  describe 'Validations' do
    it 'must be valid with valid params' do
      expect(subject).to be_valid
    end
    it 'must be saved' do
      expect(subject.save).to eq(true)
    end
    describe 'address' do
      it 'must be shorter then 120 chars' do
        subject.address = '*' * 121
        expect(subject).not_to be_valid
      end
      it 'must be longer then 5 chars' do
        subject.address = '*' * 4
        expect(subject).not_to be_valid
      end
    end

    describe 'city' do
      it 'must be shorter then 80 chars' do
        subject.city = '*' * 81
        expect(subject).not_to be_valid
      end
      it 'must be longer then 2 chars' do
        subject.city = '*'
        expect(subject).not_to be_valid
      end
    end

    describe 'zip_code' do
      it 'must be shorter then 25 chars' do
        subject.zip_code = '*' * 26
        expect(subject).not_to be_valid
      end
      it 'must be longer then 4 chars' do
        subject.zip_code = '*' * 3
        expect(subject).not_to be_valid
      end
    end

    describe 'country' do
      it 'must be shorter then 80 chars' do
        subject.country = '*' * 81
        expect(subject).not_to be_valid
      end
      it 'must be longer then 2 chars' do
        subject.country = '*'
        expect(subject).not_to be_valid
      end
    end

    describe 'phone_number' do
      it 'must be shorter then 30 chars' do
        subject.phone_number = '*' * 31
        expect(subject).not_to be_valid
      end
      it 'must be longer then 7 chars' do
        subject.phone_number = '*' * 6
        expect(subject).not_to be_valid
      end
    end

    describe 'email' do
      it 'must be valid email' do
        subject.email = 'not an email'
        expect(subject).not_to be_valid
        subject.email = 'notemail.com'
        expect(subject).not_to be_valid
        subject.email = 'testtest@test.com'
        expect(subject).to be_valid
      end
    end

    describe 'home_page' do
      it 'must be shorter then 120 chars' do
        subject.home_page = '*' * 121
        expect(subject).not_to be_valid
      end
      it 'must be longer then 4 chars' do
        subject.home_page = '*' * 3
        expect(subject).not_to be_valid
      end
    end

    describe 'company_description' do
      it 'must be shorter then 1600 chars' do
        subject.address = '*' * 1601
        expect(subject).not_to be_valid
      end
      it 'must be longer then 5 chars' do
        subject.address = '*' * 4
        expect(subject).not_to be_valid
      end
    end

    describe 'year_of_establishment' do
      it 'must be younger 2024' do
        subject.year_of_establishment = 2025
        expect(subject).not_to be_valid
      end
      it 'must be older then 1300' do
        subject.year_of_establishment = 1299
        expect(subject).not_to be_valid
      end
    end

    describe 'number_of_employes' do
      it 'must be shorter then 9999999' do
        subject.number_of_employes = 99_999_991
        expect(subject).not_to be_valid
      end
      it 'must be longer then 1' do
        subject.number_of_employes = 0
        expect(subject).not_to be_valid
      end
    end

    describe 'areas_of_interest' do
    end

    describe 'longitude' do
      it 'must smaller then 180' do
        subject.longitude = 180.00001
        expect(subject).not_to be_valid
      end
      it 'must be bigger then -180' do
        subject.longitude = -180.00001
        expect(subject).not_to be_valid
      end
    end

    describe 'latitude' do
      it 'must be smaller then 90' do
        subject.latitude = 90.00001
        expect(subject).not_to be_valid
      end
      it 'must be bigger then -90 ' do
        subject.latitude = -90.0001
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
