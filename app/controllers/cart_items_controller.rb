class CartItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if current_user.hasnt_cart?
      @cart = Cart.create(user_id: current_user.id)
      current_user.cart_id = @cart.id
      current_user.save
    end

    @cart_item =  CartItem.new(item_id: params[:item_id], cart_id: current_user.cart_id)
    if @cart_item.save
      flash[:notice] = 'Un produit a été ajouté à votre panier!'
    else
      flash[:alert] = @cart_item.errors.full_messages.to_sentence
    end
    redirect_to root_path
  end
  
  def destroy
    CartItem.destroy(params[:id])
    redirect_to root_path
  end
end