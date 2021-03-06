class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if
     @customer.update(customer_params)
     redirect_to admin_customers_path
    else
     @customer = Customer.find(params[:id])
     render :edit
    end
  end
  
  def check
    @customer = Customer.find(params[:id])
  end
  
  

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
  end

end
