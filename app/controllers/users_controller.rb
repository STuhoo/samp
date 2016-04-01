class UsersController < ApplicationController
  def new
  end
  def show
    @user = User.find(params[:id]) #why only use id? only find id?
  end
end
