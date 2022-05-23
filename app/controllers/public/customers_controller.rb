class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if
     @customer.update(customer_params)
     redirect_to customer_path(@customer.id)
    else
     @customer = Customer.find(params[:id])
     render :edit
    end
  end
  
  def check
  end
  
  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to items_path
  end
  
  def customer_params
    params.require(:customer).permit( :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address,:telephone_number)
  end
end
