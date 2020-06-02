class CartItem < ApplicationRecord
  # Validations
  validates :cart_id, uniqueness: { scope: :item_id, message: ': ce preduit est dèjà présent dans ton panier' }
  
  belongs_to :cart 
  belongs_to :item
end
