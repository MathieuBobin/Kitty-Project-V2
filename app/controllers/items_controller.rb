class ItemsController < ApplicationController
  def index
    @item = Item.all
    @category = Category.all
  end

  def show
    @item = Item.find(params[:id])

    
    #respond_to do |format|
     # format.html { redirect_to item_path }
      #format.js { }
  
    #end
  end
end
