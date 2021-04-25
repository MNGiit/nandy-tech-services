class SessionsController < ApplicationController

  def new
    if !session[:user_id] # if session doesn't have a user_id
      @user = User.new
    else   # else redirect_to another page
      redirect_to root_path
    end
  end

  def create
    # search for existing user
    @user = User.find_by(name: params[:user][:name])
    if @user # implement password check
      session[:user_id] = @user
      redirect_to @user # redirect_to user_path(@user)
    else # user wasn't found
      redirect_to login_path
    end
  end

end
