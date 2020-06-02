class CartItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def index
    @cart_item = CartItem.find(params[:item_id])
  end
  
  def create
    if current_user.hasnt_cart?
      @cart = Cart.create(user_id: current_user.id)
      current_user.cart_id = @cart.id
      current_user.save
    end
    
    @cart_item = CartItem.create(item_id: params[:item_id], cart_id: current_user.cart_id)
    redirect_to root_path
  end
  
  def destroy
    CartItem.destroy(params[:id])
    redirect_to ""
  end
end