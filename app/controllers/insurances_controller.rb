class InsurancesController < ApplicationController

  def index
    if session[:user_id]
      @insurances = Insurance.all
    else
      redirect_to login_path
    end
  end

  def new
    render :new
  end

end
