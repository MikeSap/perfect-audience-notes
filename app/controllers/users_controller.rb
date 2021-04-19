class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def index
  end

  def new        
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return  render :new unless @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
