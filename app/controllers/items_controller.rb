class ItemsController < ApplicationController
  def index
    @category = Category.all
    puts '$'*110
    puts params[:category_id]
    puts '$'*110
    category_id = params[:category_id]
    if (!category_id.nil?)
      category = Category.find(category_id)
      @items = category.items
    else
      @items = Item.all
    end
  end
  
  def show
    @item = Item.find(params[:id])

    
    #respond_to do |format|
     # format.html { redirect_to item_path }
      #format.js { }
  
    #end
  end
end
