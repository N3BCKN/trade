class InquiriesController < ApplicationController
  
  def new
  	@inquiry = Inquiry.new
  end

  def create
  	@inquiry = Inquiry.new(inquiry_params)

  	respond_to do |format|
  		if @inquiry.save
  			format.html do
  				redirect_to root_path,
  				notice: "Thank you for your message. Our team will contact you as soon as possible"
  			end
  		else
  			format.html do
  				redirect_to root_path,
  				notice: "Error. Your message could not be sent. Please try again"
  			end
  		end
  	end
  end

  private
  def inquiry_params
  	params.require(:inquiry).permit(
  		:name,
  		:subject,
  		:email,
  		:message
  		)
  end
end
