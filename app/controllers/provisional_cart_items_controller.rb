class ProvisionalCartItemsController < ApplicationController
  def create
    unique_id = cookies[:unique_id]
    
    if unique_id.nil?
      unique_id = Time.now.to_i.to_s.concat('.', Time.now.nsec.to_s) 
      cookies.permanent[:unique_id] = unique_id
      unique_id = cookies[:unique_id]
    end
    
    @provisional_cart_item = ProvisionalCartItem.create(item_id: permitted_item_id_param, unique_id: unique_id)
    if @provisional_cart_item.valid?
      flash[:notice] = 'Un produit a été ajouté à votre panier !'
    else
      flash[:alert] = purify_message(@provisional_cart_item.errors.full_messages.to_sentence)
    end
    
    redirect_back fallback_location: root_path
  end
  
  private
  
  def permitted_item_id_param
    params.permit(:item_id).require(:item_id)
  end
end