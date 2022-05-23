class Public::OrdersController < ApplicationController

def new
  @order = Order.new
end

def confirm
    @cart_items = current_customer.cart_items

  if params[:order][:select_addresses] == "0"
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name

  elsif params[:order][:select_addresses] == "1"
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  else
    @order = Order.new(order_params)
  end

    @order.shipping_cost = 800

end

def complete
end

def create
  cart_items = current_customer.cart_items.all
# ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
  @order = current_customer.orders.new(order_params)
# 渡ってきた値を @order に入れます
  if @order.save
# ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
    cart_items.each do |cart|
# 取り出したカートアイテムの数繰り返します
# order_item にも一緒にデータを保存する必要があるのでここで保存します
      order_item = OrderDetail.new
      order_item.item_id = cart.item_id
      order_item.order_id = @order.id
      order_item.amount = cart.amount
# 購入が完了したらカート情報は削除するのでこちらに保存します
      order_item.price = cart.item.price
# カート情報を削除するので item との紐付けが切れる前に保存します
      order_item.save
    end
    redirect_to orders_complete_path
    cart_items.destroy_all
# ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
  else
    @order = Order.new(order_params)
    render :new
  end
end

def index
  @orders = current_customer.orders
end

def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details

end

private
def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_price, :total_payment)
end

end
