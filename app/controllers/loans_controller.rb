class LoansController < ApplicationController
  def index
    if session[:user_id]
      @loans = Loan.all
    else
      redirect_to login_path
    end
  end

  def new
    @loan = Loan.new
    render :new
  end

  def create
    @loan = Loan.create(loan_params)
    redirect_to @loan
  end

  private

  def loan_params
    params.require(:loan).permit(:customer_name, :loan_type, :loan_amount, :pending_principle_amount, :interest_rate, :loan_closed)
  end
end
