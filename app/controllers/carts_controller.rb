class CartsController < ApplicationController
  
  def index
    @cart = Cart.all
  end
  
  def show
    @carts = Cart.find(params[:id])
  end 

   

   
end
