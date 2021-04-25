class SessionsController < ApplicationController

  def new
    if !session[:user_id] # if session doesn't have a user_id
      @user = User.new
    else   # else redirect_to another page
      redirect_to root_path
    end
  end

end
