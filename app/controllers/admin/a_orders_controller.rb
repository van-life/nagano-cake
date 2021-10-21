class Admin::AOrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @a_orders = Order.all.page(params[:page]).per(20)
  end
  
  def show
    @order = Order.find(params[:id])
    @item = OrderItem.where(order_id: params[:id])
  end
  
  def order_status
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_a_order_path(order.id)
  end
  
  def item_status
    item = OrderItem.find(params[:id])
    item.update(item_params)
    order_id = item.order_id
    redirect_to admin_a_order_path(order_id)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:order_status)
  end
  
  def item_params
    params.require(:order_item).permit(:create_status)
  end
  
end
