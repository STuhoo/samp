class UsersController < ApplicationController
  def new
    @user = User.new #define in C, used in V.(new.html.erb)
  end
  def show
    @user = User.find(params[:id]) #why only use id? only find id?
    #define in C, used in V.(show.html.erb)
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App."
      redirect_to @user
    else
      render 'new'
    end
  end
  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
