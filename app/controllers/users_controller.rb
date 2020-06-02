class UsersController < ApplicationController
  def index
    User.find(params[:id])
    @user = User.all

  end

  def new 
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
