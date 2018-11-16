class LeadsController < ApplicationController
  before_action :build_lead, only: [:new_offer, :new_product]
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
  before_action :own_contact, only: [:edit, :update]
  skip_before_action :authenticate_user!, only: [:show, :index_offers,
                                  :index_products]

  def new_offer
  end

  def new_product
  end

  def create
    @lead = current_user.leads.create(lead_params)
    @lead.lead_status = params[:lead_status]
    respond_to do |format|
      if @lead.save
        format.html {
          redirect_to lead_path(@lead),
                      notice: "Lead Has been added"
        }
      else
        format.html {
          redirect_to root_path,
                      notice: "Lead couldn't be added"
        }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html {
          redirect_to lead_path,
                      notice: "Lead has been updated"
        }
      else
        format.html {
          render :edit,
                 notice: "Error"
        }
      end
    end
  end

  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to root_path, 
                                notice: "Destroyed" }
    end
  end

  def show
    if user_signed_in?
      @message = Message.new
      @message.lead = @lead
      @message.user = current_user
      @contact = Contact.find_by_user_id(current_user)
    end
  end

  def index_products
    @leads = Lead.products_all.page params[:page]
  end

  def index_offers
    @leads = Lead.offers_all.page params[:page]
  end

  private

  def build_lead
    @contact    = current_user.contact
    @lead       = current_user.leads.build
    @categories = Category.all
  end


  def own_contact
    unless current_user.id == @lead.user.id
      redirect_to root_path
    end
  end

  def set_lead
    @lead       = Lead.find(params[:id])
    @page_title = "#{@lead.title} | Trade"
    @categories = Category.all
  end

  def lead_params
    if params[:lead_status] == "offer"
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
    elsif params[:lead_status] == "product"
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
    

end
