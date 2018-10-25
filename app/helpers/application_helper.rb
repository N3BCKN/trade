module ApplicationHelper

  def set_edit_contact(user)
    if Contact.where(user_id: user.id).blank?
      link_to "Contact Info", new_contact_path
    else
      link_to "Contact Info", edit_contact_path(user.contact)
    end
  end

end
