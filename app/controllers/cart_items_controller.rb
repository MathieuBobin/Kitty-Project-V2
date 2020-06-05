class CartItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @cart_item =  CartItem.new(item_id: params[:item_id], cart_id: current_user.cart_id)
    if @cart_item.save
      # flash[:notice] = 'Un produit a été ajouté à votre panier !'
    else
      # flash[:alert] = @cart_item.errors.full_messages.to_sentence
    end
    
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { }
    end
    
  end
  
  def destroy
    CartItem.destroy(params[:id])

    respond_to do |format|
      format.html { redirect_to mon_panier_path }
      format.js { }
    end
  end
end