class Public::AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end
  def create
     @address = Address.new(address_params)
     @address.customer_id = current_customer.id
   if @address.save
      redirect_to addresses_path
   else
      @addresses = current_customer.address.all
      render :index
   end
  end
  def edit
    @address = current_customer.address.find(params[:id])
  end
  def update
     @address = current_customer.address.find(params[:id])
    if @address.update(address_params)
     redirect_to addresses_path
    else
     @address = current_customer.address.find(params[:id])
     render :edit
    end
  end
  def destroy
    address = current_customer.address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end
