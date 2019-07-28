# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable, :lockable

  validates :user_name, presence: true, length: { minimum: 4, maximum: 25 }

  validates :email, presence: true, uniqueness: true, email_format: { message: 'email is not valid' }
  validates :encrypted_password, presence: true

  has_one   :contact
  has_many  :leads
  has_many  :messages_sent, class_name: 'Message', foreign_key: 'sender_id'
  has_many  :messages_received, class_name: 'Message', foreign_key: 'receiver_id'
  has_many  :favorite_leads
  has_many  :abuses, class_name: 'Abuse', foreign_key: 'user_id'
  has_many  :inquires, class_name: 'Inquiry', foreign_key: 'user_id'

  enum role: %i[regular premium elite admin]

  before_create :set_default_user_role

  acts_as_paranoid

  private

  def after_confirmation
    @contact = Contact.new(user_id: id)
    @contact.save!
  end

  def set_default_user_role
    self.role ||= :regular if new_record?
  end
end
