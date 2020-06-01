class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end
  
  def index
    @item = Item.all
   
   
  end

end
