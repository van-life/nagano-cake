class Admin::AItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @a_items = Item.all
  end

  def new
    @a_item = Item.new
    @genres = Genre.all
  end

  def create
    @a_item = Item.new(item_params)
    if @a_item.save
      redirect_to admin_a_item_path(@a_item.id)
    else
      redirect_to admin_a_items_path
    end
  end

  def show
    @a_item = Item.find(params[:id])
  end

  def edit
    @a_item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @a_item = Item.find(params[:id])
    @a_item.update(item_params)
    redirect_to admin_a_item_path(item_params)
  end

  def destroy
    @a_item = Item.find(params[:id])
    @a_item.destroy
    redirect_to admin_a_items_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :status)
  end

end
