class ContactsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_contact, only: [:show, :edit, :update]
  before_action :owned_contact, only: [:edit]

  def show
    
  end

  def new
    @contact = current_user.build_contact
  end

  def create
    @contact = current_user.create_contact(contact_params)

    respond_to do |format|
      if @contact.save
        format.html {redirect_to root_path, notice: "Contact has been updated"}
      else
        format.html {render :new, notice: "Error"}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html {redirect_to root_path, notice: "Contact has been updated"}
      else
        format.html {render :edit, notice: "Error"}
      end
    end
  end

  private
  def contact_params
    params.require(:contact).permit(
      :address, 
      :city, 
      :zip_code, 
      :country, 
      :phone_number, 
      :company_description,
      :home_page,
      :year_of_establishment)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end 

  def owned_contact
    unless @contact.user === current_user
      redirect_to root_path
    end
  end

end
