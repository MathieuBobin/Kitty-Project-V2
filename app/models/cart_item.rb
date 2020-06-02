class CartItem < ApplicationRecord
  # Validations
<<<<<<< HEAD
  validates :cart_id, uniqueness: { scope: :item_id, message: ': Le produit a déjà été ajouté à votre panier' }
=======
  validates :cart_id, uniqueness: { scope: :item_id, message: ': ce preduit est dèjà présent dans ton panier' }
>>>>>>> a80707c32cdc28979360cbbed81b4c34c98849ce
  
  belongs_to :cart 
  belongs_to :item
end
