class Item < ApplicationRecord
  belongs_to :cart
  has_many :order_items
  has_many :orders, through: :order_items
end