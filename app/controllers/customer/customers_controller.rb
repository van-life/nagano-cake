class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:top,:about]
  
  def top
    @items = Item.where(status: true).order(created_at: :desc).limit(4)
    # 全商品か、販売中のものでallかwhere(status: true)、順番は降順:desc,昇順:asc
    @genres = Genre.all
  end
  
  def about
  end
  
  def show
    @customer = current_customer
  end
  
  def quit
  end
  
  def out
    current_customer.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path(current_customer)
    else
      render :edit
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:adress,:telephone_number,:email)
  end

end
