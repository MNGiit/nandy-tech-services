class UsersController < ApplicationController

  def show
    @user = User.where(id:params[:id]).first
    if @user == nil
      redirect_to login_path
    end
  end

end
