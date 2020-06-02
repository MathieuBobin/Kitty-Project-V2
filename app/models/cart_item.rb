class CartItem < ApplicationRecord
  # Validations
  validates :cart_id, uniqueness: { scope: :item_id, message: ': Le produit a déjà été ajouté à votre panier' }
  
  belongs_to :cart 
  belongs_to :item
end
