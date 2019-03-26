class AbusesController < ApplicationController

	def create
		@lead = Lead.find(params[:id])
		@abuse = Abuse.create(message_params)
		@abuse.user = current_user
		@abuse.lead = @lead
		
		respond_to do |format|
			if @abuse.save
				format.html do
					redirect_to root_path
					notice: "Thank you for your informations. Our team will consider if this lead violate standards of quality."
				end
			else
				format.html do 
					render :new
				end
			end
		end
	end

	private

	def abuse_params
		params.require(:abuse).permit(:content)
	end
end
