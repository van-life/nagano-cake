class Customer::CItemsController < ApplicationController
  # before_action :authenticate_customer!, only: [:show]
  
  def index
    # statusカラムの記述方法によって変更する
    @genres = Genre.all
    @items = Item.where(status: true).page(params[:page]).per(8)
    @amount = @items.total_count
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end
