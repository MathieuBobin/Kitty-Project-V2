class OrdersController < ApplicationController
  def index
  end
 
  def create
    @order = Order.create(user_id: current_user.id)
    @items = CartItem.where({cart_id: current_user.cart_id})
    @items.each do |itemid|
      OrderItem.create(order_id: @order.id, item_id: itemid.item_id)
    end
    redirect_to action: "index"
  end
end
