class CartsController < ApplicationController
  def index
    @cart = Cart.all
  end
  
  def show
    puts params
    # @cart = Cart.find(params[:id])
    # @item_list = CartItem.where("cart_id = #{params[:id]}")
    @cart = current_user_cart
    @item_list = @cart.cart_items
    
    array = []
    @item_list.each do |x|
      array << Item.find(x.item_id).price
    end
    
    @total = array.inject(0){|sum,x| sum + x }

   
  end
end