module ContactsHelper
	
	def set_user_avatar(contact, img_id = null)
		if contact.avatar_file_name.nil?
			image_tag "default_user_avatar.png", :class=>"img-fluid", :id=> img_id
		else
			image_tag contact.avatar.url, :class=>"img-fluid", :id=> img_id
		end
	end
end
