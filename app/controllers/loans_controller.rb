class LoansController < ApplicationController
  def index
    if session[:user_id]
      @loans = Loan.all
    else
      redirect_to login_path
    end
  end
end
