class OrdersController < ApplicationController
  def create
    @cart = Cart.find(params[:id])
    @cart_item = CartItem.find_by(id: @cart.id)
    @cart_item.item_id.each do |itemid|
      {@order = Order.new()}
  end

  def show
  end
end
