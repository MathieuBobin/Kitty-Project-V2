class ItemsController < ApplicationController
  def index
    @category = Category.all
    
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
  end
end
