# frozen_string_literal: true

module ContactsHelper
  def set_user_avatar(contact, img_id = nil)
    if contact.avatar_file_name.nil?
      image_tag 'default_user_avatar.png', class: 'img-fluid', id: img_id
    else
      image_tag contact.avatar.url, class: 'img-fluid', id: img_id
    end
  end

  def set_avatar_tiny(user)
  	if user.contact.avatar_file_name.nil?
  		'assets/avatar_default_tiny.png'
  	else
  		contact.avatar.url(:tiny)
  	end
  end 
end
