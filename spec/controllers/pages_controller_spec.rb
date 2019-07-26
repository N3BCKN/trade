# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #home' do
    it 'renders root path' do
      get :home
      expect(response).to have_http_status(:ok)
      expect(response).to render_template :home
    end
  end

  describe 'GET #about' do
    it 'renders root path' do
      get :about
      expect(response).to render_template :about
    end
  end

  describe 'GET #faq' do
    it 'renders faq path' do
      get :faq
      expect(response).to render_template :faq
    end
  end

  describe 'GET #terms' do
    it 'renders terms path' do
      get :terms
      expect(response).to render_template :terms
    end
  end

  describe 'GET #privacy_policy' do
    it 'renders privacy_policy path' do
      get :privacy_policy
      expect(response).to render_template :privacy_policy
    end
  end

  describe 'GET #post_lead_helper' do
    it 'renders post_lead_helper path' do
      get :post_lead_helper
      expect(response).to render_template :post_lead_helper
    end
  end

  describe 'GET #membership_status' do
    it 'renders membership_status path' do
      get :membership_status
      expect(response).to render_template :membership_status
    end
  end

  describe 'GET #visits_limit' do
    it 'renders visits_limit path' do
      get :visits_limit
      expect(response).to render_template :visits_limit
    end
  end

  describe 'GET #carriers' do
    it 'renders carriers path' do
      get :carriers
      expect(response).to render_template :carriers
    end
  end

  describe 'GET #for_press' do
    it 'renders for_press path' do
      get :for_press
      expect(response).to render_template :for_press
    end
  end

  describe 'GET #partnership' do
    it 'renders partnership path' do
      get :partnership
      expect(response).to render_template :partnership
    end
  end
end
