class CartsController < ApplicationController
  
  def index
    @cart = Cart.all
  end
  
  def show
    @cart = Cart.find(params[:id])
    @cart_items = CartItem.where(cart_id: @cart.id, ordered: false)
    @item_list = CartItem.where("cart_id = #{params[:id]}")
    puts CartItem.where("cart_id = #{params[:id]}")
  end
end