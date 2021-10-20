class Customer::COrdersController < ApplicationController
  def index
    @orders= current_customer.orders
  end
  
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end
  
  def create
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
  
  def confirm
    
  end
  
  def update
  end
  
  def thanks
  end
end
