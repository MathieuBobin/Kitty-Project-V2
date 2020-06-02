class CartItem < ApplicationRecord
  # Validations
<<<<<<< HEAD
  validates :cart_id, uniqueness: { scope: :item_id, message: ': ce preduit est dèjà présent dans ton panier' }
=======
  validates :cart_id, uniqueness: { scope: :item_id, message: ': Le produit a déjà été ajouté à votre panier' }
>>>>>>> 01d28a158d2e2629efdb773b393b28fc26b141d3
  
  belongs_to :cart 
  belongs_to :item
end
