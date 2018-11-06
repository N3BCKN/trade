class NotificationsMailer < ApplicationMailer

	def send_lead_response(message,lead,url_path)
		
		mail(
			to:   lead.user.email,
			subject: "RE: #{lead.title}",
			body: "You have received a reponse to: #{lead.title} 
			link: #{url_path}
			Message: #{message.content}
			from user with email: #{message.email}"
			)
	end
end
