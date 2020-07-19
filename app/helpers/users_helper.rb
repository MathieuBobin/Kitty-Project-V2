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
    ProvisionalCartItem.where(unique_id: disconnected_user_unique_id)
  end

  def disconnected_user_cart_items_count
    items_quantities = disconnected_user_cart_items.map { |rec|
      rec.quantity
    }

    items_quantities.sum
  end

  def disconnected_user_cart_total
    sutotals = disconnected_user_cart_items.map {|rec| 
      rec.quantity * rec.item.price
    }

    sutotals.sum
  end

  def add_provisional_cart_to_current_user_cart
    disconnected_user_cart_items.sort_by(&:created_at).each { |rec|
      CartItem.create(cart: current_user_cart, item: rec.item, quantity: rec.quantity)
    }
    
    disconnected_user_cart_items.destroy_all
  end
end