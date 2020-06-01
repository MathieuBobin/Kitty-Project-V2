class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end
  
  def index
    puts params
    @item = Item.all
  end

end
