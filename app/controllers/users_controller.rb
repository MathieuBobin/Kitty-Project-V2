class UsersController < ApplicationController
  def index
    User.find(params[:id]
  end
end
