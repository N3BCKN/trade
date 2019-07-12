# frozen_string_literal: true

Rails.application.routes.draw do
  get 'inquiries/create'
  # Custom Profiles Paths
  get 'profile/dashboard', to: 'profiles#show_profile'
  get 'profile/offers',    to: 'profiles#show_offers'
  get 'profile/products',  to: 'profiles#show_products'
  get 'profile/messages',  to: 'profiles#show_messages'
  get 'profile/favorites', to: 'profiles#show_favorites'
  get 'profile/membership', to: 'profiles#profile_membership'

  # Custom Devise Paths
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout', edit: 'profile/editpassword' }

  # Custom Leads Paths
  get 'new_offer',   to: 'leads#new_offer'
  get 'new_product', to: 'leads#new_product'
  get 'offers',      to: 'leads#index_offers'
  get 'products',    to: 'leads#index_products'

  # Custom Static Pages
  get 'about',              to: 'pages#about'
  get 'terms',              to: 'pages#terms'
  get 'privacy',            to: 'pages#privacy_policy'
  get 'faq',                to: 'pages#faq'
  get 'email_marketing',    to: 'pages#email_marketing'
  get 'marketing_campaign', to: 'pages#marketing_campaign'
  get 'lead_helper',        to: 'pages#post_lead_helper'
  get 'membership',         to: 'pages#membership_status'
  get 'limit_reached',      to: 'pages#visits_limit'
  get 'carriers',           to: 'pages#carriers'
  get 'for_press',          to: 'pages#for_press'
  get 'partnership',        to: 'pages#partnership' 

  # Custom Categories Paths
  get 'offers/categories/:category',   to: 'categories#index_offers', as: 'offers_categories'
  get 'products/categories/:category', to: 'categories#index_products', as: 'products_categories'

  get 'leads/:id/sent', to: 'leads#suggested_leads', as: 'suggested_leads'

  get 'contact_us',     to: 'inquiries#new'
  post 'inquiries',     to: 'inquiries#create'

  resources :leads do
    member do
      resources :messages
      resources :abuses
      put 'favorites/update'
    end
  end

  resources :contacts
  root to: 'pages#home'
end
