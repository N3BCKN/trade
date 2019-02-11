# frozen_string_literal: true

module ContactsHelper
  def user_avatar(contact, img_id = nil)
    if contact.avatar?
      image_tag contact.avatar.url, class: 'img-fluid', id: img_id
    else
      image_tag 'default_user_avatar.png', class: 'img-fluid', id: img_id
    end
  end

  def avatar_tiny(user)
    if user.contact.avatar?
      user.contact.avatar.url(:tiny)
    else
      'assets/avatar_default_tiny.png'
    end
  end
end
