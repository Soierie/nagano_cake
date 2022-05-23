class Admin::HomesController < ApplicationController

def index
  @orders = Order.all.page(params[:page]).per(5)
  
end

end
