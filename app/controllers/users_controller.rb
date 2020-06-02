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
    if current_user.id != @user.id
      flash[:error] = "Vous n'êtes pas autorisés."
    redirect_to root_path
  end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Ton profil a été mis-à-jour."
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end

  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
