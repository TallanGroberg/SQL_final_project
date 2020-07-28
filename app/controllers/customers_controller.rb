class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]


  def index
    @customers = Customer.customers(current_user.id)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = current_user.customers.new
  end

  def create
    #
    Customer.create_customer(customer_params, current_user.id)
    redirect_to customers_path 
  end

  def edit
  end

  def update
    Customer.update_customer(@customer.id, customer_params)
    redirect_to customers_path
 
    
  end

  def destroy
    Customer.delete_customer(@customer.id)
    redirect_to customers_path
 
  end

  private 

  def set_customer
    #SELECT single record
    @customer = Customer.single_customer(current_user.id, params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone)
  end


end
