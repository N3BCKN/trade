# frozen_string_literal: true

class LeadsController < ApplicationController
  include SearchFilters
  include UserLimits

  before_action :check_user_restrictions, only: :create
  before_action :build_lead, only: %i[new_offer new_product]
  before_action :set_lead, only: %i[show edit update destroy]
  before_action :own_contact, only: %i[edit update]
  before_action :fetch_filter_params, only: %i[index_offers index_products]

  skip_before_action :authenticate_user!, only: %i[show index_offers
                                                   index_products]

  def new_offer
  end

  def new_product
  end

  def create
    @lead = current_user.leads.create(lead_params)
    @lead.lead_status = params[:lead_status]
    respond_to do |format|
      if @lead.save
        format.html do
          redirect_to lead_path(@lead),
            notice: 'Lead Has been added'
        end
      else
        format.html do
          redirect_to root_path,
            notice: "Lead couldn't be added"
        end
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html do
          redirect_to lead_path,
            notice: 'Lead has been updated'
        end
      else
        format.html do
          render :edit,
            notice: 'Error'
        end
      end
    end
  end

  def destroy
    @lead.destroy
    respond_to do |format|
      format.html do
        redirect_to root_path,
          notice: 'Destroyed'
      end
    end
  end

  def show
    if user_signed_in?
      @message         = current_user.messages.build
      @message.lead    = @lead
      @contact         = current_user.contact
      @favorite_exists = FavoriteLead
                         .where(lead: @lead, user: current_user) != []
    end
  end

  def index_products
    if !params[:q].nil?
      prepare_indexed_leads(params[:q], 'product', @filters)
    else
      @leads = []
    end
  end

  def index_offers
    if !params[:q].nil?
      prepare_indexed_leads(params[:q], 'offer', @filters)
    else
      @leads = []
    end
  end

  private

  def prepare_indexed_leads(query, status, filters)
    # translate filter params hash into arrays of strings
    @translatedFilters = translateFilters(filters)

    @leads = Lead.search_leads(query, status, @translatedFilters)
                 .page params[:page]

    @countries = Lead.search_leads(query, status)
                     .aggregations['group_by_country']['buckets']

    @categories = Lead.search_leads(query, status)
                      .aggregations['group_by_category']['buckets']
  end

  def fetch_filter_params
    @filters = {
      date:       params[:date],
      categories: params[:category],
      countries:  params[:country],
      continents: params[:continent]
    }
  end

  def build_lead
    @contact    = current_user.contact
    @lead       = current_user.leads.build
    @categories = Category.all
  end

  def own_contact
    redirect_to root_path unless current_user == @lead.user
  end

  def set_lead
    @lead       = Lead.find(params[:id])
    @categories = Category.all
  end

  def lead_params
    if params[:lead_status] == 'offer'
      params.require(:lead).permit(
        :title,
        :lead_status,
        :description,
        :contact_person,
        :address,
        :city,
        :zip_code,
        :country,
        :phone_number,
        :home_page,
        :category_id
      )
    elsif params[:lead_status] == 'product'
      params.require(:lead).permit(
        :title,
        :description,
        :lead_status,
        :contact_person,
        :address,
        :city,
        :zip_code,
        :country,
        :phone_number,
        :home_page,
        :category_id,
        :product_image
      )
    end
  end

  def check_user_restrictions
    @number_of_leads = current_user.leads
                                   .where('created_at >= ?', Time.current - 7.days)
                                   .count

    if @number_of_leads >= user_limits(current_user.role, 'leads')
      respond_to do |format|
        format.html do
          redirect_to root_path,
            notice: 'Your account has reached leads limit. Please try again later.'
        end
      end
    end
  end
end
