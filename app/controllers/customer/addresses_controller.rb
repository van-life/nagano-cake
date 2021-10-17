class Customer::AddressesController < ApplicationController
  def index
    customer = Customer.find(current_user.id)
    @addresses = customer.addresses
  end

  def create
    @addresses = Address.new(address_params)
    @addresses.user_id = current_user.id
    if @addresses.save
      redirect_to customer_addresses(current_user)
    else
      @addresses = Address.customer
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
    if @address.user == current_user
      render :edit
    else
      redirect_to customer_addresses
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(book_params)
      redirect_to customer_addresses(current_user)
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
  end
  
  private
  
  def address_params
    params.require(:adress).permit(:name, :postal_code, :address)
  end
  
end
