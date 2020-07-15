class ProvisionalCartItem < ApplicationRecord
  # Relationship
  belongs_to :item

  # Validations
  validates :unique_id, uniqueness: {scope: :item_id, message: 'Ce produit est déjà présent dans votre panier !'}
end
