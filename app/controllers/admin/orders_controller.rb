class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_items = OrderItem.where(order_id: @order)
    @product_status = @order.order_items.pluck(:product_status)
  end

  def update
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order)
    @order.update(order_params)

    if @order.status == "入金確認"
      @order_items.update_all(product_status: 1)
    end
    redirect_to admin_order_path(@order)

  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
