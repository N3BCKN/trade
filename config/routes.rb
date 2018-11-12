Rails.application.routes.draw do

  #Custom Profiles Paths
  get 'profile/mine',      to: "profiles#show_profile"
  get 'profile/offers',    to: "profiles#show_offers"
  get 'profile/products',  to: "profiles#show_products"
  get 'profile/messages',  to: "profiles#show_messages"

  #Custom Devise Paths
  devise_for :users, path: "", path_names: {sign_in: "login", sign_up: "register", sign_out: "logout"}

  #Custom Leads Paths
  get "new_offer",   to: "leads#new_offer"
  get "new_product", to: "leads#new_product"
  get "offers",      to: "leads#index_offers"
  get "products",    to: "leads#index_products"

  get "offers/categories/:category",   to: "categories#index_offers", :as => 'offers_categories'
  get "products/categories/:category", to: "categories#index_products", :as => 'products_categories'

  resources :leads do
    member do
      resources :messages
    end
  end 
  resources :contacts
  root to: "pages#home"

end
