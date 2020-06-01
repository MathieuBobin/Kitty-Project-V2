class CartsController < ApplicationController
  
  def index
    @cart = Cart.all
  end
  
  def show
    @cart = Cart.find(params[:id])
    @cart_items = CartItem.where(cart_id: @cart.id, ordered: false)
  end
end