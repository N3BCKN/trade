class CategoriesController < ApplicationController
   skip_before_action :authenticate_user!
   before_action      :find_category_by_name, only: 
   [:index_offers, :index_products]
  
  def index_offers
  	@leads = Lead.where(lead_status: "offer", category_id: @category.ids).page params[:page]
  end

  def index_products
  	@leads = Lead.where(lead_status: "product", category_id: @category.ids).page params[:page]
  end

  private
  def find_category_by_name
  	@category   = Category.where(name: params[:category])
    @page_title = "Trade | Search by #{params[:category]}"  
  end
end
