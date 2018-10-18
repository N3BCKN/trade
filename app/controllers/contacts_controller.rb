class ContactsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_contact, only: [:show, :edit, :update]
  def show
    
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @user    = current_user

    respond_to do |format|
      if @contact.save
        @user.contact_id = @contact.id
        @user.save  
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
    params.require(:contact).permit(:address, :city, :zip_code, :country, :phone_number, :company_description,:year_of_establishment)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end 
end
