class SessionsController < ApplicationController

  def new
    if !session[:user_id] # if session doesn't have a user_id
      @user = User.new
    else   # else redirect_to another page
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
