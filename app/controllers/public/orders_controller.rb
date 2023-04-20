class Public::OrdersController < ApplicationController

  def index
  end

  def new
    @order = Order.new
    @delivery_address = current_customer.address
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postcode = @address.postcode
    @order.address = @address.address
    @order.name = @address.name
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.freight = 800
    @order.save
    redirect_to orders_thanx_path
  end

  def show
  end

  def thanx
  end


  private

  def order_params
    params.require(:order).permit(:delivery_postcode, :delivery_address, :delivery_name, :billing_amount, :payment_method, :customer_id, :status)
  end

end
