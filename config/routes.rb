Rails.application.routes.draw do

  #Custom Devise Paths
  devise_for :users, path: "", path_names: {sign_in: "login", sign_up: "register", sign_out: "logout"}

  #Custom Leads Paths
  get "new_offer", to: "leads#new_offer"
  get "new_product", to: "leads#new_product"
  get "offers", to: "leads#index_offers"
  get "products", to: "leads#index_products"

  resources :leads
  resources :contacts
  resources :categories
  root to: "pages#home"

end
