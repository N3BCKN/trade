class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :user_name, presence: true, length: {minimum: 4, maximum: 25}

  validates :email, presence: true, unique: true
  validates :encrypted_password, presence: true


  has_one   :contact
  has_many  :leads
  has_many  :messages
  has_many   :favorite_leads

  enum role: [:regular, :premium, :elite, :admin]

  before_create :set_default_user_role

  acts_as_paranoid

  private
  def after_confirmation
    @contact = Contact.new(user_id: self.id)
    @contact.save!
  end

  def set_default_user_role
    self.role ||= :regular if self.new_record?
  end

end
