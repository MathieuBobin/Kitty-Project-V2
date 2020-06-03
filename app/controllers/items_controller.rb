class ItemsController < ApplicationController
  def index
    @item = Item.all
    puts params
    puts cookies
    puts current_user
  end

  def show
    @item = Item.find(params[:id])
  end
end
