class CartItem < ApplicationRecord
  # Validations
  validates :cart_id, uniqueness: { scope: :item_id, message: ': item already exist in your cart' }
  
  belongs_to :cart 
  belongs_to :item
end
