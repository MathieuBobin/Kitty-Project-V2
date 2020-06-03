class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def total
    prices = self.items.map { |item|
      item.price
    }

    prices.sum
  end
end
