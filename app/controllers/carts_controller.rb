class CartsController < ApplicationController
  
  def index
    @cart = Cart.all
  end
  
  def show
    @cart = Cart.find(params[:id])
    @item_list = CartItem.where("cart_id = #{params[:id]}")
    
    
    array = []
    @item_list.each do |x|
      array << Item.find(x.item_id).price
    end
    
    @total = array.inject(0){|sum,x| sum + x }

  end
end