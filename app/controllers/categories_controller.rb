# frozen_string_literal: true

class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action      :find_categories_by_name, only:
                                                     %i[index_offers index_products]

  def index_offers
    @leads = Lead.search_categories(params[:category], 'offer')
                 .page params[:page]
  end

  def index_products
    @leads = Lead.search_categories(params[:category], 'product')
                 .page params[:page]
  end

  private

  def find_categories_by_name
    @categories = Category.all
    @category = begin
                  Category.find_by! name: params[:category]
                rescue StandardError
                  render_not_found
                end
  end
end
