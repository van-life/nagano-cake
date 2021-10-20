class Customer::COrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @orders= current_customer.orders
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
  
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end
  
  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(
      customer_id: current_customer.id,
      payment: params[:order][:payment]
    )

    price_all = 0
    @cart_items.each do |cart_item| 
      price_all += (cart_item.item.price * cart_item.quantity)
    end
    
    @order.total_price = price_all*1.1.floor
    
    
    if params[:order][:addresses] == "current_customer_address"
      @order.postal_code = current_customer.postal_code
      @order.address     = current_customer.address
      @order.name        = "#{current_customer.first_name}#{current_customer.last_name}"

    # addressにshipping_addressesの値がはいっていれば
    elsif params[:order][:addresses] == "registration_address"
      @reg_address = Address.find(params[:order][:address_id])
      @order.postal_code = @reg_address.postal_code
      @order.address     = @reg_address.address
      @order.name        = @reg_address.name

    # addressにnew_addressの値がはいっていれば
    elsif params[:order][:addresses] == "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.address     = params[:order][:address]
      @order.name        = params[:order][:name]
      @new = "1"
      
      unless @order.valid? == true
        @ddresses = current_customer.addresses
        render :new
      end
    end
  end
  
  
  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    # flash[:notice] = "ご注文が確定しました。"
    redirect_to thanks_c_orders_path

    if params[:order][:new] == "1"
      Address.create(
        customer_id: current_customer.id,
        name: @order.name,
        postal_code: @order.postal_code,
        address: @order.address
      )
    end

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    OrderItem.create(
      item:  cart_item.item,
      order_id: @order.id,
      quantity: cart_item.quantity,
      price: cart_item.item.price
    )
    end
    @cart_items.destroy_all
  end
  
  def thanks
  end
  
  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment, :total_price)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end
end
