class OrdersController < ApplicationController
  def new
  end
  
  def create
    @amount = 500
    
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "Paiment of #{current_user.first_name} #{current_user.last_name}",
      currency: 'eur',
      })

    @order = Order.create(user_id: current_user.id)
    @cart_items = CartItem.where({cart_id: current_user.cart_id})
    @cart_items.each do |cart_item|
      OrderItem.create(order_id: @order.id, item_id: cart_item.item_id)
    end

    # empty the cart
    CartItem.where(cart_id: current_user.cart_id).destroy_all

    rescue Stripe::CardError => e
      flash[:error] = e.message
      render :new
  end
end