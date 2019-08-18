# frozen_string_literal: true

module ContactsHelper
  def user_avatar(contact, img_id = nil)
    if contact.avatar?
      image_tag contact.avatar.url(:default), class: 'float-left p-3', width: 170, height: 170, id: img_id
    else
      image_tag 'default_user_avatar.png', class: 'float-left p-3', width: 170, height: 170, id: img_id
    end
  end

  def avatar_edit(contact, img_id = nil)
    if contact.avatar?
      image_tag contact.avatar.url(:default), class: 'img-fluid', id: img_id, width: 300, height: 300
    else
      image_tag 'default_user_avatar.png', class: 'img-fluid', id: img_id, width: 300, height: 300
    end
  end

  def avatar_tiny(user)
    if user.contact.avatar?
      user.contact.avatar.url(:tiny)
    else
      asset_path 'avatar_default_tiny.png'
    end
  end
end
