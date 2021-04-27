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

  def show
    # @insurance = Insurance.find(params[:id]) # works but can lead to error if id isn't found
    @insurance = Insurance.find_by(id: params[:id])
    if !@insurance
      redirect_to new_insurance_path
    end
  end

  def edit
    # user = User.find_by(id: session[:user_id]) # can't find user
    user = User.find_by(id: session[:user_id].first[1])
    if user
      if user.isAdmin
        @insurance = Insurance.find(params[:id])
      else
        redirect_to insurances_path
      end
    else
      redirect_to login_path
    end
  end

  def update
    @insurance = Insurance.find(params[:id])
    user = User.find_by(id: session[:user_id].first[1])
    if user && user.isAdmin
      #@insurance.update(insurance_params)
      #@insurance.update(approval_param)
      @insurance.approval = true
      @insurance.save

      redirect_to @insurance
    else
      redirect_to login_path
    end
  end

  def search
    if params[:query].blank?
      @insurance = Insurance.find_by(id: params[:query2])
    else
       @insurance = Insurance.find_by(customer_name: params[:query])
    end

    if @insurance
      redirect_to @insurance
    else
      redirect_to insurances_path
    end
  end

  private

  def insurance_params
    params.require(:insurance).permit(:customer_name, :insurance_policy, :total_coverage_amount, :premium_amount, :due_date, :maturity_date)
  end
end
