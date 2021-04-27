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

  def show
    # @insurance = Insurance.find(params[:id]) # works but can lead to error if id isn't found
    @loan = Loan.find_by(id: params[:id])
    if !@loan
      redirect_to new_loan_path
    end
  end

  def edit
    # user = User.find_by(id: session[:user_id]) # can't find user
    user = User.find_by(id: session[:user_id].first[1])
    if user
      if user.isAdmin
        @loan = Loan.find(params[:id])
      else
        redirect_to loans_path
      end
    else
      redirect_to login_path
    end
  end

  def update
    @loan = Loan.find(params[:id])
    user = User.find_by(id: session[:user_id].first[1])
    if user && user.isAdmin
      #@insurance.update(insurance_params)
      #@insurance.update(approval_param)
      @loan.approval = true
      @loan.save

      redirect_to @loan
    else
      redirect_to login_path
    end
  end

  def search
    if params[:query2]
      @loan = Loan.find_by(id: params[:query2])
    elsif
      @loan = Loan.find_by(customer_name: params[:query])
    end

    if @loan
      redirect_to @loan
    else
      redirect_to loans_path
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:customer_name, :loan_type, :loan_amount, :pending_principle_amount, :interest_rate, :loan_closed)
  end
end
