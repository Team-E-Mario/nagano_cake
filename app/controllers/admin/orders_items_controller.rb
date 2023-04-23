class Admin::OrdersItemsController < ApplicationController
  
  def update
    @order = Order.find(params[:id])
    @order.item = OrderItem.find(params[:order_item][order_item.id])
    if @order_item.update(order_item_params)
      if @order.order_items.pluck(:product_status).include?("製作中")
        @order.status = 2
        @order.save
      elsif
        @order.order_items.pluck(:product_status).all?{|status|status == "製作完了"}
        @order.status = 3
        @order.save
      end
    end
  end
  
  private
  
  def order_item_params
    params.require(:order_item).permit(:product_status)
  end
  
end
