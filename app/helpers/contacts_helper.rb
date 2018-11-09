module ContactsHelper
	
	def set_user_avatar(contact)
		if contact.avatar_file_name.nil?
			image_tag "default_user_avatar.png"
		else
			image_tag contact.avatar.url
		end
	end
end
