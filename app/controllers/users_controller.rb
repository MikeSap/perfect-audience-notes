class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new        
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash[:alert] = nil
      session[:user_id] = @user.id
      return redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages[0]
      render :new
   end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
