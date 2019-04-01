# frozen_string_literal: true

class ContactsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :show
  before_action :set_contact, only: %i[show edit update]
  before_action :check_user_contact, only: [:edit]

  def show
    if user_signed_in?
      @contact = Contact.friendly.find(params[:id])
      @user            = @contact.user.reload
      @message         = current_user.messages_sent.build
      @message.receiver = @user
    end
  end

  def new
    @contact = current_user.build_contact
  end

  def create
    @contact = current_user.create_contact(contact_params)

    respond_to do |format|
      if @contact.save
        format.html do
          redirect_to root_path,
            notice: 'Contact has been updated'
        end
      else
        format.html do
          render :new,
            notice: 'Error'
        end
      end
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html do
          redirect_to root_path,
            notice: 'Contact has been updated'
        end
      else
        format.html do
          render :edit,
            notice: 'Error'
        end
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
      :year_of_establishment,
      :avatar,
      :annual_sales,
      :number_of_employes,
      :latitude,
      :longitude,
      areas_of_interest: []
    )
  end

  def set_contact
      @contact = Contact.friendly.find(params[:id]) rescue render_not_found
  end

  def check_user_contact
    redirect_to root_path unless @contact.user == current_user
  end
end
