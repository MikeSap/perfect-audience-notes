class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:login, :create]
  
  def index  
    @notes = @current_user.notes.order('created_at DESC')
  end    

  def login
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user ==  nil
        flash[:alert] = ("You have entered an incorrect Username")
        return redirect_to '/login'   
    end      
    unless @user.try(:authenticate, params[:user][:password])
      flash[:alert] = "Password invalid"
      return redirect_to '/login'   
    end
    session[:user_id] = @user.id
    redirect_to '/'
  end

  def destroy
    session.delete :user_id  
    redirect_to '/'
  end

end