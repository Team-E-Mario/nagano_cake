class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to 
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:address, :postcode, :name, :customer_id)
  end

end
