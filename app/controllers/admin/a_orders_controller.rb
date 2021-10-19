class Admin::AOrdersController < ApplicationController
  
  def index
    @a_orders = Order.all
  end
  
  def show
    @order_status = Order.find(params[:id])
    @item_status = OrderItem.find(params[:id])
  end
  
  def order_status
    @order_status = Order.find(params[:id])
    @order_status.update
    redirect_to admin_a_orders_path
  end
  
  def item_status
    @item_status = OrderItem.find(params[:id])
    @item_status.update
    redirect_to admin_a_orders_path
  end
  
end
