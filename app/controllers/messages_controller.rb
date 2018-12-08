class MessagesController < ApplicationController


  def index
  end

  def show
  end

  def create
  	@message         = Message.create(message_params)
    @lead            = Lead.find(params[:id])
  	@message.user    = current_user
  	@message.lead    = @lead
  
  	
  	respond_to do |format|
	  	if @message.save
	  		 NotificationsMailer.send_lead_response(
		  	   @message,
		  	   @lead, 
		  	   params[:absolute_url]
		  	 ).deliver_now

	  		format.html { redirect_to root_path, 
	  			notice:  "Your message has been sent"}
	  	else
	  		format.html { render :new,
	  			notice: "Message couldn't be delivered"}
	  	end
    end
  end

  private
  def message_params
  	params.require(:message).permit(
  	 :content,
  	 :email,
  	 :phone_number,
  	 :country,
  	 :contact_person
  	)
  end
end
