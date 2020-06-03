class Order < ApplicationRecord
  after_create :welcome_payment
  belongs_to :user, optional: true
  has_many :order_items 
  has_many :items, through: :order_items

  def welcome_payment
    OrderMailer.welcome_order(self).deliver_now
  end
end
