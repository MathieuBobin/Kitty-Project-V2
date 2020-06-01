class User < ApplicationRecord
  belongs_to :cart, optional: true
  has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def hasnt_cart?
    self.cart_id.nil?
  end        
end