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

  def create
    # params[:insurance].merge!(user_id: params[:user_id]) # .merge helps add :user_id to params[:insurance]
    @insurance = Insurance.create(insurance_params)
    redirect_to @insurance
    # @insurance = Insurance.new(insurance_params)
    # if @insurance.valid?
    #  @insurance.save
    #  redirect_to @insurance
    #  else
    #  redirect_to :new
    # end
  end

  private

  def insurance_params
    params.require(:insurance).permit(:customer_name, :insurance_policy, :total_coverage_amount, :premium_amount, :due_date, :maturity_date)
  end
end
