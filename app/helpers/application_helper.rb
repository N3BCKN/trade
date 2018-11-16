module ApplicationHelper

  def set_edit_contact user
    if Contact.where(user_id: user.id).blank?
      link_to "Contact Info", new_contact_path
    else
      link_to "Contact Info", edit_contact_path(user.contact)
    end
  end

   def country_name country_code
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end

   def full_title dynamic_title
      main_title = "Trade "
      dynamic_title.empty? ?  main_title : "#{main_title} | #{dynamic_title}"
  end


end
