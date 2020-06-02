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

    # create new order here

    rescue Stripe::CardError => e
      flash[:error] = e.message
      render :new
  end
end