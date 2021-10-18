class Admin::AOrdersController < ApplicationController
  
  def index
    @a_orders = Order.all
  end
  
  def show
    @a_order = Order.find(params[:id])
  end
  
  def update
  end
  
end
