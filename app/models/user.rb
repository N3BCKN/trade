# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable

  validates :user_name, presence: true, length: { minimum: 4, maximum: 25 }

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

  has_one   :contact
  has_many  :leads
  has_many  :messages_sent, class_name: 'Message', foreign_key: 'sender_id'
  has_many  :messages_received, class_name:'Message', foreign_key: 'receiver_id'
  has_many   :favorite_leads

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
