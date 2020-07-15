class CartItemsController < ApplicationController
  def index
    @cart = current_user_cart
    @cart_items = @cart.cart_items
    
    @total_quantities = current_user_cart_items_count
    @amount = current_user_cart_total
  end
  
  def create
    @cart_item =  CartItem.create(item_id: params[:item_id], cart_id: current_user.cart_id)
    if @cart_item.valid?
      # flash[:notice] = 'Un produit a été ajouté à votre panier !'
    else
      # flash[:alert] = purify_message(@cart_item.errors.full_messages.to_sentence)
    end
    
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js { }
    end
    
  end
  
  def destroy
    @cart_item_id = params[:id]
    CartItem.destroy(@cart_item_id)
    
    respond_to do |format|
      format.html { redirect_to cart_items_path }
      format.js { }
    end
  end
end