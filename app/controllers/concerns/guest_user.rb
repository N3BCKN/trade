# frozen_string_literal: true

module GuestUser
  extend ActiveSupport::Concern

  def guest_or_current_user
    if current_user
      if cookies.signed[:guest_user_email]
        guest_user.delete
        cookies.delete :guest_user_email
          end
      current_user
    else
      guest_user
        end
  end

  def guest_user
    @cached_guest_user ||=
      Guest.find_by!(email: (cookies.permanent.signed[:guest_user_email] ||= create_guest_user.email))
  rescue ActiveRecord::RecordNotFound
    cookies.delete :guest_user_email
    guest_user
  end

  private

  def create_guest_user
    guest = Guest.create(email: "guest_#{Time.now.to_i}#{rand(150)}@guest.com")
    guest.save!
    guest
  end
end
