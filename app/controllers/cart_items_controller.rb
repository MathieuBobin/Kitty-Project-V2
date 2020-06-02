class CartItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if current_user.hasnt_cart?
      @cart = Cart.create(user_id: current_user.id)
      current_user.cart_id = @cart.id
      current_user.save
    end
    
    CartItem.create(item_id: params[:item_id], cart_id: current_user.cart_id)
    redirect_to root_path
  end
  
  def destroy
    CartItem.destroy(params[:id])
  end
end