class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_items = OrderItem.where(order_id: @order)
    @product_status = @order.order_items.pluck(:product_status)
  end

  def update
  end

end
