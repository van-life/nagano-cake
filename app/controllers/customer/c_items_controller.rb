class Customer::CItemsController < ApplicationController
  
  def index
    # statusカラムの記述方法によって変更する
    @items = Item.where(status: true).page(params[:page]).per(8)
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
