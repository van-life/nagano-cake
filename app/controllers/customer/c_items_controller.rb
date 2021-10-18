class Customer::CItemsController < ApplicationController
  # before_action :authenticate_customer!, only: [:show]
  
  def index
    # statusカラムの記述方法によって変更する
    @items = Item.where(status: true).page(params[:page]).per(8)
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_items = CartItem.new
  end
end
