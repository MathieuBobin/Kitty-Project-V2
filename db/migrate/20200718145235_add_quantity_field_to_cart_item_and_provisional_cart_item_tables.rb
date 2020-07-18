class AddQuantityFieldToCartItemAndProvisionalCartItemTables < ActiveRecord::Migration[5.2]
  def change
    change_column :cart_items, :quantity, :integer, :default=> 1
    add_column :provisional_cart_items, :quantity, :integer, :default=>1
  end
end
