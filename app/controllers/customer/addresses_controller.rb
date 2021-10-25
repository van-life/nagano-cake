class Customer::AddressesController < ApplicationController

  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path(current_customer)
    else
      @address = Address.customer
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
    if @address.customer_id == current_customer.id
      render :edit
    else
      redirect_to addresses_path(current_customer)
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path(current_customer)
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path(current_customer)
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
