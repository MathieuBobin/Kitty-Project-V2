module UsersHelper
  def current_user_cart
    current_user.cart
  end

  def current_user_cart_total
    current_user_cart.total
  end

  def empty_current_user_cart
    current_user_cart.cart_items.destroy_all
  end

  def current_user_cart_items_count
    current_user_cart.items_count
  end

  def disconnected_user_unique_id
    cookies[:disconnected_user_unique_id]
  end

  def disconnected_user_cart_items
    ProvisionalCartItem.where(unique_id: disconnected_user_unique_id).sort_by(&:created_at)
  end

  def disconnected_user_cart_items_count
    disconnected_user_cart_items.count
  end

  def disconnected_user_cart_total
    items_prices = disconnected_user_cart_items.map {|rec| 
      rec.item.price
    }

    items_prices.sum
  end

  def add_provisional_cart_to_current_user_cart
    disconnected_user_cart_items.each { |rec|
      CartItem.create(cart: current_user_cart, item: rec.item)
    }
    
    disconnected_user_cart_items.destroy_all
  end
end