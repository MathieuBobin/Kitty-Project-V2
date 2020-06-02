class User < ApplicationRecord
  after_create :welcome_send
  belongs_to :cart, optional: true
  has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def hasnt_cart?
    self.cart_id.nil?
  end   

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end