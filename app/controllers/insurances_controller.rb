class InsurancesController < ApplicationController

  def index
    if session[:user_id]
      @insurances = Insurance.all
    else
      redirect_to login_path
    end
  end

  def new
    @insurance = Insurance.new
    render :new
  end

end
