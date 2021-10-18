class Customer::CartItemsController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @cart_items = Cart_item.find_by(customer_id: current_user.id)
  end
  
  def create
    item = Item.find(params[:item_id])
    cart_item = Cart_item.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.item_id = item.id
  end
  
  def update
    cart_item = Cart_item.find(params[:id])
    cart_item.update(cart_item_params)
  end
  
  def destroy
    cart_item = Cart_item.find(params[:id])
    cart_item.destroy
  end
  
  def all_destroy
    cart_items = Cart_item.find_by(customer_id: current_user.id)
    cart_items.destroy_all
  end
  
  private 
  
  def cart_item_params
    params.require(:cat_item).permit(:quantity)
  end
  
end
