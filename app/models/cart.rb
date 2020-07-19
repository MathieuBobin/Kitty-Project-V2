class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items
  has_many :items, through: :cart_items

  def total
    subtotals = self.cart_items.map { |rec|
      rec.quantity * rec.item.price
    }

    subtotals.sum
  end

  def items_count
    items_quantities = self.cart_items.map { |rec|
      rec.quantity
    }

    items_quantities.sum
  end
end
