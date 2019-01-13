# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe 'GET #show_profile' do
    it 'returns http success' do
      get :show_profile
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show_products' do
    it 'returns http success' do
      get :show_products
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show_offers' do
    it 'returns http success' do
      get :show_offers
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show_notifications' do
    it 'returns http success' do
      get :show_notifications
      expect(response).to have_http_status(:success)
    end
  end
end
