class Public::OrdersController < ApplicationController

  def index
  end

  def new
    @order = Order.new
    @delivery_address = current_customer.delivery_address
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

  def confirm
  end

  private

  def order_params
    params.require(:order).permit(:delivery_postcode, :delivery_address, :delivery_name, :billing_amount, :payment_method, :customer_id, :status)
  end

end
