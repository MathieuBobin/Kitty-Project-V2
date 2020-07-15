class ProvisionalCartItemsController < ApplicationController
  def index
    @provisional_cart_items = disconnected_user_cart_items
    @total_quantities = disconnected_user_cart_items_count
    @amount = disconnected_user_cart_total
  end
  
  def create
    if disconnected_user_unique_id.nil?
      unique_id = Time.now.to_i.to_s.concat('.', Time.now.nsec.to_s) 
      cookies.permanent[:disconnected_user_unique_id] = unique_id
    end
    
    @provisional_cart_item = ProvisionalCartItem.create(item_id: permitted_item_id_param, unique_id: disconnected_user_unique_id)
    if @provisional_cart_item.valid?
      flash[:notice] = 'Un produit a été ajouté à votre panier !'
    else
      flash[:alert] = purify_message(@provisional_cart_item.errors.full_messages.to_sentence)
    end
    
    redirect_back fallback_location: root_path
  end
  
  def destroy
    ProvisionalCartItem.destroy(params[:id])

    redirect_to provisional_cart_items_path
  end
  
  private
  
  def permitted_item_id_param
    params.permit(:item_id).require(:item_id)
  end
end