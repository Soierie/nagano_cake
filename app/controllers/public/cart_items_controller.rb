class Public::CartItemsController < ApplicationController

def index
 @cart_items = CartItem.all
end

def update
 @item = current_customer.cart_items.find(params[:id])
 @item.update(cart_item_params)
 redirect_to cart_items_path
end

def create

 @item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])

 if @item
     @item.amount += params[:cart_item][:amount].to_i
 else
     @item = CartItem.new(cart_item_params)
 end

 @item.save
 redirect_to cart_items_path
end

def destroy
 item = CartItem.find(params[:id])
 item.destroy
 redirect_to cart_items_path
end

def destroy_all
 items = current_customer.cart_items
 items.destroy_all
 redirect_to cart_items_path
end

private
def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
end

end
