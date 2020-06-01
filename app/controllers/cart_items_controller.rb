class CartItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

 def index
  @cart_item = CartItem.find(params[:item_id])
 end

  def create
    if current_user.hasnt_cart?
      Cart.create(user_id: current_user.id)
    end
    
    @cart_item = CartItem.create(item_id: params[:item_id], cart_id: @current_user.cart_id)
   end

   def show
   end
end
