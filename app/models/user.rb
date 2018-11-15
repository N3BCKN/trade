class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :user_name, presence: true, length: {minimum: 4, maximum: 25}

  validates :email, presence: true
  validates :encrypted_password, presence: true


  has_one   :contact
  has_many  :leads

  acts_as_paranoid

  private
  def after_confirmation
    @contact = Contact.new(user_id: self.id)
    @contact.save!
  end

end
